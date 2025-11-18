import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_moobile_11pplg_29/controllers/mainnav_controller.dart';

class MainnavPage extends StatelessWidget {
  MainnavPage({super.key});

  final controller = Get.find<MainnavController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Column(
          children: [
            Padding(padding: const EdgeInsets.fromLTRB(12, 12, 12, 6)),
            Expanded(child: controller.pages[controller.selectedIndex.value]),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: "Home",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.shop), label: "Product"),
            BottomNavigationBarItem(
              icon: Icon(Icons.shop),
              label: "Favorite Product",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: "Profile",
            ),
          ],
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changePage,
        ),
      ),
    );
  }
}
