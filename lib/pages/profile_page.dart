import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_moobile_11pplg_29/themes/app_color.dart';
import 'package:pas_moobile_11pplg_29/controllers/auth_controller.dart';
import 'package:pas_moobile_11pplg_29/widgets/button_widget.dart';
import 'package:pas_moobile_11pplg_29/widgets/profile_widget.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryDark,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: AppColors.surface,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const ProfileItem(
                      imageUrl:
                          'https://i.pinimg.com/1200x/dc/70/5f/dc705fd3d053ccb3eacf6a575dc5c6a8.jpg',
                      name: 'Adika Ruzain',
                      email: 'adikaruzain@gmail.com',
                    ),

                    const SizedBox(height: 16),

                    Card(
                      color: AppColors.surface,
                      elevation: 2,
                      shadowColor: AppColors.shadow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                        side: const BorderSide(
                          color: AppColors.border,
                          width: 0.5,
                        ),
                      ),
                      child: Column(
                        children: const [
                          ListTile(
                            leading: Icon(
                              Icons.person_outline,
                              color: AppColors.primaryDark,
                            ),
                            title: Text(
                              'Account',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            subtitle: Text(
                              'Manage your profile and personal info',
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ),
                          Divider(height: 0),
                          ListTile(
                            leading: Icon(
                              Icons.lock_outline,
                              color: AppColors.textSecondary,
                            ),
                            title: Text('Privacy & Security'),
                            subtitle: Text(
                              'Password, login activity',
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: AppButton(
                text: "Logout",
                onPressed: controller.logout,
                backgroundColor: AppColors.error,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
