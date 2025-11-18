import 'package:flutter/material.dart';
import 'package:pas_moobile_11pplg_29/themes/app_color.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primaryDark,
        automaticallyImplyLeading: false,
        title: const Text(
          'Home',
          style: TextStyle(
            color: AppColors.surface,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Center(child: Text("Welcome To My App!")),
    );
  }
}
