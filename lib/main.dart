import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_moobile_11pplg_29/themes/app_color.dart';
import 'package:pas_moobile_11pplg_29/routes/pages.dart';
import 'package:pas_moobile_11pplg_29/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryDark),
      ),
      initialRoute: AppRouter.splashscreen,
      getPages: AppPages.pages,
    );
  }
}
