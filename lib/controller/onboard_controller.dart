import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_architecture_GetX/model/userLogin.dart';
import 'package:mvc_architecture_GetX/utils/api_services.dart';
import 'package:mvc_architecture_GetX/utils/pop_up.dart';
import 'package:mvc_architecture_GetX/utils/strings.dart';
import 'package:mvc_architecture_GetX/view/auth/homepage.dart';
import 'package:mvc_architecture_GetX/view/auth/login_view.dart';

final OnboardController onboardController = Get.put(OnboardController());

class OnboardController extends GetxController {
  final brandEditProfileFormKey = GlobalKey<FormState>().obs;
  final Rx<TextEditingController> emailController = TextEditingController().obs;
  final Rx<TextEditingController> passwordController =
      TextEditingController().obs;
  final Rx<TextEditingController> signUpEmailController =
      TextEditingController().obs;
  final Rx<TextEditingController> signUpPasswordController =
      TextEditingController().obs;
  final Rx<TextEditingController> nameController = TextEditingController().obs;
  final Rx<TextEditingController> genderController =
      TextEditingController().obs;
  final Rx<TextEditingController> mobileController =
      TextEditingController().obs;
  var userLoginModel = LoginModel().obs;
  // var userSignUpModel = SignUpModel().obs
  RxBool isPasswordObscured = true.obs;
  final Rx<FocusNode> emailFocusNode = FocusNode().obs;
  final Rx<FocusNode> passwordFocusNode = FocusNode().obs;
  final Rx<FocusNode> nameFocusNode = FocusNode().obs;
  final Rx<FocusNode> genderFocusNode = FocusNode().obs;
  final Rx<FocusNode> mobileFocusNode = FocusNode().obs;

//! userSignUp Api

  Future userSignUp() async {
    Map<String, dynamic> payload = {
      'name': nameController.value.text,
      'gender': genderController.value.text,
      'email': signUpEmailController.value.text,
      'mobile': mobileController.value.text,
      'password': signUpPasswordController.value.text
    };
    try {
      var response = await ApiServices.postData(ApiUrl.signUpApi, payload);
      if (response.containsKey('error')) {
        ErrorPopup.showError(Get.context!, response['error']);
        return false;
      }
      if (response["success"] == true) {
        nameController.value.clear();
        mobileController.value.clear();
        signUpEmailController.value.clear();
        genderController.value.clear();
        signUpEmailController.value.clear();
        Get.off(() => const LoginView());
        return true;
      } else {
        ErrorPopup.showError(Get.context!, response['msg']);
        return false;
      }
    } catch (e) {
      ErrorPopup.showError(Get.context!, e.toString());
      return false;
    }
  }

  //! Login APi

  Future<bool> userLogin() async {
    Map<String, dynamic> payload = {
      'email': emailController.value.text.trim(),
      'password': passwordController.value.text.trim()
    };
    try {
      var response = await ApiServices.postData(ApiUrl.loginApi, payload);

      if (response != null) {
        log('case 1'); //if succesfully login
        if (response.containsKey('success')) {
          if (response['success'] == true) {
            log('case 2'); //if succesfully login
            LoginModel userLoginData = LoginModel.fromJson(response['data']);
            userLoginModel.value = userLoginData;
            emailController.value.clear();
            passwordController.value.clear();
            Get.offAll(() => const HomePage());
            return true;
          } else {
            log('case 3');
            // log the error message from the API
            String errorMessage = response.containsKey('message')
                ? response['message']
                : 'Invalid login details, Please check your login details and try again.';
            if (kDebugMode) {
              print('Error Message: $errorMessage');
            }
            // Show the error message in the ErrorPopup

            ErrorPopup.showErrorDialog(Get.context!, errorMessage);
            return false;
          }
        } else {
          log('case 4');
          // Handle the case where 'success' key is not present in the response
          ErrorPopup.showErrorDialog(Get.context!,
              'Invalid login details, Please check your login details and try again.');
          return false;
        }
      } else {
        log('case 5');
        // Handle the case where response is null
        ErrorPopup.showErrorDialog(Get.context!,
            'Invalid login details, Please check your login details and try again.');
        return false;
      }
    } catch (e, stackTrace) {
      log('case 6');
      log('$e\n$stackTrace');
      // Show the error message in the ErrorPopup
      ErrorPopup.showErrorDialog(Get.context!,
          'Invalid login details, Please check your login details and try again.');
      return false;
    }
  }
}
