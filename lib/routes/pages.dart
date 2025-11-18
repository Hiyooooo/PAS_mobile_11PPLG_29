import 'package:get/get_navigation/get_navigation.dart';
import 'package:pas_moobile_11pplg_29/bindings/app_binding.dart';
import 'package:pas_moobile_11pplg_29/bindings/splashscreen_binding.dart';
import 'package:pas_moobile_11pplg_29/pages/detailproduct_page.dart';
import 'package:pas_moobile_11pplg_29/pages/favoriteproduct_page.dart';
import 'package:pas_moobile_11pplg_29/pages/login_page.dart';
import 'package:pas_moobile_11pplg_29/pages/mainnav_page.dart';
import 'package:pas_moobile_11pplg_29/pages/product_page.dart';
import 'package:pas_moobile_11pplg_29/pages/profile_page.dart';
import 'package:pas_moobile_11pplg_29/pages/register_page.dart';
import 'package:pas_moobile_11pplg_29/pages/splashscreen_page.dart';
import 'package:pas_moobile_11pplg_29/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRouter.splashscreen,
      page: () => SplashscreenPage(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: AppRouter.loginpage,
      page: () => LoginPage(),
      binding: AppBinding(),
    ),
    GetPage(
      name: AppRouter.registerpage,
      page: () => RegisterPage(),
      binding: AppBinding(),
    ),
    GetPage(
      name: AppRouter.mainnavpage,
      page: () => MainnavPage(),
      binding: AppBinding(),
    ),
    GetPage(
      name: AppRouter.productpage,
      page: () => ProductPage(),
      binding: AppBinding(),
    ),
    GetPage(
      name: AppRouter.favoritepage,
      page: () => FavoriteproductPage(),
      binding: AppBinding(),
    ),
    GetPage(
      name: AppRouter.detailproductpage,
      page: () => DetailProductPage(),
      binding: AppBinding(),
    ),
    GetPage(
      name: AppRouter.profilepage,
      page: () => ProfilePage(),
      binding: AppBinding(),
    ),
  ];
}
