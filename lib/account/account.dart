import 'package:brainshield/account/account_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountScreen extends GetWidget<AccountController> {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Obx(() => Text(controller.address.value)),
            Obx(() {
              final status = controller.status.value;
              if (status == Status.loading) {
                return CircularProgressIndicator();
              } else {
                return Text(controller.pictureCount.value);
              }
            }),
            TextButton(
              onPressed: () => controller.getPictureCount(),
              child: Text("Get picture count"),
            ),
          ],
        ),
      ),
    );
  }
}
