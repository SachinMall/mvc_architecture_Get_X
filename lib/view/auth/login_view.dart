import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mvc_architecture_GetX/controller/onboard_controller.dart';
import 'package:mvc_architecture_GetX/view/auth/signup_view.dart';
import 'package:mvc_architecture_GetX/view/auth/widget/custom_elevatedbutton.dart';
import 'package:mvc_architecture_GetX/view/auth/widget/custom_textfield.dart';
import '../../utils/const.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // OnboardController onboardController = Get.find();

  final _formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/login.png'),
            height20,
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: onboardController.emailController.value,
                    focusNode: onboardController.emailFocusNode.value,
                    hinttext: 'Email',
                    keyboardtype: TextInputType.emailAddress,
                    onChanged: (value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email Required';
                      }
                      return null;
                    },
                    onfieldSubmit: (value) {},
                  ),
                  height20,
                  ValueListenableBuilder(
                    valueListenable: _obsecurePassword,
                    builder: (BuildContext context, bool value, Widget? child) {
                      return CustomTextField(
                        hinttext: 'Password',
                        controller: onboardController.passwordController.value,
                        focusNode: onboardController.passwordFocusNode.value,
                        isPassword: true,
                        obscureText: value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password Required';
                          }
                          return null;
                        },
                        suffixIcon: InkWell(
                          onTap: () {
                            _obsecurePassword.value = !_obsecurePassword.value;
                          },
                          child: Icon(_obsecurePassword.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility),
                        ),
                        onfieldSubmit: (value) {},
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Get.to(() => const SignUpPage());
                  },
                  child: const Text("Sign UP"),
                ),
              ),
            ),
            height30,
            CommonElevatedButton(
              name: 'Login',
              buttonwidth: 0.5,
              textStyle: const TextStyle(
                  fontSize: 14, color: kwhite, fontWeight: FontWeight.w500),
              ontap: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  onboardController.userLogin();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
