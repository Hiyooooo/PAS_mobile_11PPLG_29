import 'package:get/get.dart';
import 'package:pas_moobile_11pplg_29/controllers/auth_controller.dart';
import 'package:pas_moobile_11pplg_29/controllers/mainnav_controller.dart';
import 'package:pas_moobile_11pplg_29/controllers/product_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<MainnavController>(() => MainnavController());
    Get.lazyPut<ProductController>(() => ProductController());
  }
}
