import 'package:crafty_bay/presentation/ui/screens/splash_screen.dart';
import 'package:crafty_bay/presentation/ui/utilis/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBayApp extends StatelessWidget {
  const CraftyBayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const SplashScreen(),
      theme: ThemeData(
        colorSchemeSeed: AppColors.themeColor,
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
            headlineLarge:
                TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
        ),
        inputDecorationTheme: InputDecorationTheme(
            border: _outLineInputBorder(),
            focusedBorder: _outLineInputBorder(),
            enabledBorder: _outLineInputBorder(),
            errorBorder: _outLineInputBorder(Colors.red),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.themeColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              textStyle: const TextStyle(fontSize: 16),
              fixedSize: const Size.fromWidth(double.maxFinite)),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              foregroundColor: AppColors.themeColor,
              textStyle: const TextStyle(fontSize: 16)),
        ),
      ),
    );
  }

  OutlineInputBorder _outLineInputBorder([Color? color]) {
    return OutlineInputBorder(
        borderSide:  BorderSide(
          color: color ?? AppColors.themeColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8));
  }
}
