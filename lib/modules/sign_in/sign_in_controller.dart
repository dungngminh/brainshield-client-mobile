import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class SignInController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();
  var isHidePassword = true.obs;

  void turnOnOffHiddenPassword() {
    isHidePassword.value = !isHidePassword.value;
    update();
  }

  void resetValue() {
    emailController.text = "";
     passwordController.text = "";
  }
}
