import 'package:brainshield/routes/app_pages.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class SignInController extends GetxController {
  final TextEditingController privateKeyController = TextEditingController();
  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();
  var isHidePassword = true.obs;

  void turnOnOffHiddenPassword() {
    isHidePassword.value = !isHidePassword.value;
    update();
  }

  void resetValue() {
    privateKeyController.text = "";
  }

  void signIn() {
    Get.toNamed(AppRoutes.rHome);
  }

  checkMetaMaskInstalled() async {
    bool isInstalled = await DeviceApps.isAppInstalled('io.metamask');
    DeviceApps.openApp('io.metamask');
    print(isInstalled);
  }
}
