import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller_binder.dart';
import 'presentation/ui/utility/app_theme_data.dart';
import 'presentation/ui/screens/auth/splash_screen.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: CraftyBayAppThemeData.lightThemeData,
      home: const SplashScreen(),
      initialBinding: ControllerBinder(),
    );
  }
}

