import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_moobile_11pplg_29/app_color.dart';
import 'package:pas_moobile_11pplg_29/controllers/auth_controller.dart';
import 'package:pas_moobile_11pplg_29/widgets/button_widget.dart';
import 'package:pas_moobile_11pplg_29/widgets/profile_header.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.surface,
        elevation: 1,
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Bagian atas: isi penuh dan center
            Expanded(
              child: Container(
                width: double.infinity,
                color: AppColors.surface,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Center(
                    child: ProfileHeader(
                      imageUrl:
                          'https://i.pinimg.com/1200x/dc/70/5f/dc705fd3d053ccb3eacf6a575dc5c6a8.jpg',
                      name: 'Adika Ruzain',
                      email: 'adikaruzain@gmail.com',
                    ),
                  ),
                ),
              ),
            ),

            // Tombol logout di bawah
            Padding(
              padding: const EdgeInsets.all(16),
              child: AppButton(
                text: "Logout",
                onPressed: () {
                  controller.logout();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
