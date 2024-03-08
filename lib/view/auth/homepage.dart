import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_architecture_GetX/view/auth/login_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text(
          "Home",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: TextButton(
            onPressed: () {
              Get.offAll(()=>const LoginView());
            },
            child:const Text("Log Out")),
      ),
    );
  }
}
