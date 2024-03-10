import 'package:ezom/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ezom/features/authentication/screens/verify_email/verify_email.dart';
import 'package:ezom/navigation_menu.dart';
import 'package:ezom/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  // Todo: Add Widgets Binding
  // Todo: Init Local Storage
  // Todo: Await Native Splash
  // Todo: Initialize Firebase
  // Todo: Initialize Authentication
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      // theme: ThemeData(
      //   textTheme:
      //       const TextTheme(bodyLarge: TextStyle(fontSize: 24, color: Colors.green)),
      // ),
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      // home: const BoardingScreen(),
      home: const NavigatoinMenu(),
      // home: const VerifyEmailScreen(),
    );
  }
}
