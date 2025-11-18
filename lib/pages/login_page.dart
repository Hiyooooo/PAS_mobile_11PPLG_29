import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_moobile_11pplg_29/app_color.dart';
import 'package:pas_moobile_11pplg_29/controllers/auth_controller.dart';
import 'package:pas_moobile_11pplg_29/routes/routes.dart';
import 'package:pas_moobile_11pplg_29/widgets/button_widget.dart';
import 'package:pas_moobile_11pplg_29/widgets/textfield_widget.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Card(
            color: AppColors.surface,
            elevation: 10,
            shadowColor: AppColors.shadow,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 8),

                  Image.asset('assets/images/logo.png', height: 60),

                  const SizedBox(height: 12),

                  Text(
                    'Practice MobileDev',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.primaryDark,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 4),

                  Text(
                    'Latihan mobile development',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 24),

                  AppTextField(
                    label: "Username",
                    prefixIcon: const Icon(Icons.person_rounded),
                    controller: controller.username,
                  ),

                  const SizedBox(height: 16),

                  Obx(
                    () => AppTextField(
                      label: "Password",
                      prefixIcon: const Icon(Icons.lock_rounded),
                      controller: controller.password,
                      obscureText: !controller.isPasswordVisible.value,
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isPasswordVisible.value
                              ? Icons.visibility_rounded
                              : Icons.visibility_off_rounded,
                        ),
                        onPressed: controller.isPasswordVisible.toggle,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Obx(
                    () => controller.isloading.value
                        ? const CircularProgressIndicator()
                        : SizedBox(
                            width: double.infinity,
                            child: AppButton(
                              text: "Login",
                              onPressed: controller.login,
                            ),
                          ),
                  ),

                  const SizedBox(height: 20),
                  AppButton(
                    text: "Register",
                    onPressed: () {
                      Get.toNamed(AppRouter.registerpage);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
