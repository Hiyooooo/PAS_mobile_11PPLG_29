import 'package:get/get.dart';
import 'package:pas_moobile_11pplg_29/pages/favoriteproduct_page.dart';
import 'package:pas_moobile_11pplg_29/pages/home_page.dart';
import 'package:pas_moobile_11pplg_29/pages/product_page.dart';
import 'package:pas_moobile_11pplg_29/pages/profile_page.dart';

class MainnavController extends GetxController {
  var selectedIndex = 0.obs;

  void changePage(index) {
    selectedIndex.value = index;
  }

  final pages = [
    HomePage(),
    ProductPage(),
    FavoriteproductPage(),
    ProfilePage(),
  ];
}
