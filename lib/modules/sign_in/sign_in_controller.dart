import 'package:brainshield/core/theme.dart';
import 'package:brainshield/data/remote/eth_provider.dart';
import 'package:brainshield/routes/app_pages.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_store/open_store.dart';
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

  checkMetaMaskInstalled(BuildContext context) async {
    bool isInstalled = await DeviceApps.isAppInstalled('io.metamask');
    print(isInstalled);
    if (isInstalled) {
      DeviceApps.openApp('io.metamask');
    } else {
      try {
        OpenStore.instance.open(androidAppBundleId: 'io.metamask');
      } catch (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Có lỗi xảy ra vui long thử lại",
              style: GoogleFonts.openSans(
                color: kColor4,
              ),
            ),
          ),
        );
      }
    }
  }

  getAddress(BuildContext context) async {
    if (privateKeyController.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          content: Text(
            "Vui lòng không được để trống",
            style: GoogleFonts.openSans(
              color: kColor4,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
      btnController.error();
      Future.delayed(Duration(seconds: 2))
          .then((value) => btnController.reset());
    } else {
      await EthProvider()
          .getCredentials(privateKeyController.text)
          .then((value) {
        print("oke");
        btnController.success();
        Future.delayed(Duration(seconds: 2))
            .then((value) => Get.offNamed(AppRoutes.rAccount));
      }).onError((error, stackTrace) {
        print("error");
        btnController.error();
        Future.delayed(Duration(seconds: 2))
            .then((value) => btnController.reset());
      });
    }
  }
}
