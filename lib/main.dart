import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_architecture_GetX/controller/onboard_controller.dart';

import 'view/auth/login_view.dart';

void main() {
  runApp(const MyApp());
  Get.put(OnboardController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const LoginView(),
    );
  }
}
