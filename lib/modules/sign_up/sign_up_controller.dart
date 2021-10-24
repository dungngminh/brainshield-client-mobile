

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class SignUpController extends GetxController {
  //obs variable
  final isHidePassword = true.obs;
  final isHideRepassword = true.obs;

  //controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();

  //repository

  void turnOnOffHiddenPassword() {
    isHidePassword.value = !isHidePassword.value;
    update();
  }

  void turnOnOffHiddenRepassword() {
    isHideRepassword.value = !isHideRepassword.value;
    update();
  }


  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    super.dispose();
  }
}