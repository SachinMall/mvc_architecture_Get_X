import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_architecture_GetX/utils/const.dart';
import 'package:mvc_architecture_GetX/utils/utils.dart';
import 'package:mvc_architecture_GetX/view/auth/widget/custom_textfield.dart';

import '../../controller/onboard_controller.dart';
import 'widget/custom_elevatedbutton.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  OnboardController onboardController = Get.find();

 final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: Get.height * 0.3,
              width: Get.width,
              padding: const EdgeInsets.only(top: 30, left: 20),
              color: const Color(0xff17232F),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  height50,const
                  Text(
                    'Register',
                    style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  height5,const
                  Text(
                    'Create your account',
                    style:  TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      hinttext: 'Name',
                      controller: onboardController.nameController.value,
                      focusNode: onboardController.nameFocusNode.value,
                      keyboardtype: TextInputType.text,
                      onfieldSubmit: (value) {
                        Utils.feildFocusChange(
                            context,
                            onboardController.nameFocusNode.value,
                            onboardController.genderFocusNode.value);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter your Name";
                        } else if (value == " ") {
                          return "Enter your name";
                        }
                        return null;
                      },
                    ),
                    height20,
                    CustomTextField(
                      hinttext: 'Gender',
                      controller: onboardController.genderController.value,
                      keyboardtype: TextInputType.text,
                      focusNode: onboardController.genderFocusNode.value,
                      onfieldSubmit: (value) {
                        Utils.feildFocusChange(
                            context,
                            onboardController.genderFocusNode.value,
                            onboardController.emailFocusNode.value);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter your Gender";
                        } else if (value == " ") {
                          return "Enter your Gender";
                        }
                        return null;
                      },
                    ),
                    height20,
                    CustomTextField(
                      hinttext: 'Email',
                      controller: onboardController.signUpEmailController.value,
                      keyboardtype: TextInputType.emailAddress,
                      focusNode: onboardController.emailFocusNode.value,
                      onfieldSubmit: (value) {
                        Utils.feildFocusChange(
                            context,
                            onboardController.emailFocusNode.value,
                            onboardController.mobileFocusNode.value);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter your Email";
                        } else if (value == " ") {
                          return "Enter your Email";
                        }
                        return null;
                      },
                    ),
                    height20,
                    CustomTextField(
                      hinttext: 'Mobile',
                      controller: onboardController.mobileController.value,
                      keyboardtype: TextInputType.phone,
                      focusNode: onboardController.mobileFocusNode.value,
                      onfieldSubmit: (value) {
                        Utils.feildFocusChange(
                            context,
                            onboardController.mobileFocusNode.value,
                            onboardController.passwordFocusNode.value);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter your Mobile No";
                        } else if (value == " ") {
                          return "Enter your Mobile No";
                        }
                        return null;
                      },
                    ),
                    height20,
                    ValueListenableBuilder(
                      valueListenable: _obsecurePassword,
                      builder:
                          (BuildContext context, bool value, Widget? child) {
                        return CustomTextField(
                          controller:
                              onboardController.signUpPasswordController.value,
                          hinttext: 'Password',
                          isPassword: true,
                          obscureText: value,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your Password";
                            } else if (value == " ") {
                              return "Enter your Password";
                            }
                            return null;
                          },
                          suffixIcon: InkWell(
                            onTap: () {
                              _obsecurePassword.value =
                                  !_obsecurePassword.value;
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
                  onboardController.userSignUp();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
