import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/utils.dart';
import 'package:http/http.dart' as http;
import 'package:pas_moobile_11pplg_29/app_color.dart';
import 'package:pas_moobile_11pplg_29/models/login_model.dart';
import 'package:pas_moobile_11pplg_29/models/register_model.dart';
import 'package:pas_moobile_11pplg_29/network/client_network.dart';
import 'package:pas_moobile_11pplg_29/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final username = TextEditingController();
  final password = TextEditingController();

  final fullname = TextEditingController();
  final email = TextEditingController();

  var isloading = false.obs;
  var isPasswordVisible = false.obs;

  void register() async {
    if (username.text.isEmpty ||
        password.text.isEmpty ||
        fullname.text.isEmpty ||
        email.text.isEmpty) {
      Get.snackbar(
        "Auth",
        "Field can't be empty",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.error,
        colorText: AppColors.surface,
      );
      return;
    }

    try {
      isloading.value = true;
      final res = await http.post(
        Uri.parse("${ClientNetwork.baseURLV1}/latihan/register-user"),
        body: {
          "username": username.text,
          "password": password.text,
          "full_name": fullname.text,
          "email": email.text,
        },
      );

      if (res.statusCode == 200) {
        final model = registerModelFromJson(res.body);
        if (model.status) {
          Get.snackbar(
            "Auth",
            "Register Success",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColors.success,
            colorText: AppColors.surface,
            duration: Duration(seconds: 1),
          );

          Get.toNamed(AppRouter.loginpage);
        } else {
          Get.snackbar(
            "Error",
            "Failed register, Status: (${res.statusCode})",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColors.error,
            colorText: AppColors.surface,
          );
        }
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString(), backgroundColor: AppColors.error);
    }
    isloading.value = false;
  }

  void login() async {
    if (username.text.isEmpty || password.text.isEmpty) {
      Get.snackbar(
        "Auth",
        "Username or password can't be empyt",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.error,
        colorText: AppColors.surface,
      );
      return;
    }

    try {
      isloading.value = true;

      final res = await http.post(
        Uri.parse("${ClientNetwork.baseURL}/latihan/login"),
        body: {"username": username.text, "password": password.text},
      );

      if (res.statusCode == 200) {
        final model = loginModelFromJson(res.body);

        if (model.status) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', model.token);

          Get.snackbar(
            "Auth",
            "Login Success",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColors.success,
            colorText: AppColors.surface,
            duration: const Duration(seconds: 1),
          );

          Get.offNamed(AppRouter.mainnavpage);
        } else {
          Get.snackbar("Auth", model.message, backgroundColor: AppColors.error);
        }
      } else {
        Get.snackbar(
          "Error",
          "Failed Login, Status: (${res.statusCode})",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.error,
          colorText: AppColors.surface,
        );
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString(), backgroundColor: AppColors.error);
    }
    isloading.value = false;
  }

  void logout() async {
    Get.defaultDialog(
      title: "Confim",
      middleText: "Are you sure want to logout?",
      textCancel: "No",
      textConfirm: "Yes",
      confirmTextColor: AppColors.textPrimary,
      onConfirm: () async {
        final prefs = await SharedPreferences.getInstance();
        await prefs.remove('token');
        Get.offAllNamed(AppRouter.loginpage);
      },
    );
  }
}
