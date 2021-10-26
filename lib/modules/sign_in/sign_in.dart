import 'package:brainshield/core/theme.dart';
import 'package:brainshield/modules/sign_in/sign_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class SignInScreen extends GetWidget<SignInController> {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 45, left: 20, right: 20),
          child: Column(
            children: [
              Row(children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(Icons.arrow_back, color: kColor4),
                )
              ]),
              Center(
                child: SizedBox(
                  height: 283,
                  width: 317,
                  child: Image.asset(
                    "assets/metamask.png",
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Nhập Private Key".toUpperCase(),
                    style: GoogleFonts.openSans(
                      fontSize: 24,
                      color: kColor4,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 50,
                width: 330,
                child: Stack(
                  children: [
                    Obx(
                      () => TextFormField(
                        controller: controller.privateKeyController,
                        style: GoogleFonts.openSans(
                          color: kColor4,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlignVertical: TextAlignVertical.center,
                        obscureText: controller.isHidePassword.value,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(
                              color: kColor4,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(
                              color: kColor4,
                            ),
                          ),
                          fillColor: kColor4,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: kColor4,
                          ),
                          hintText: 'Private key...',
                          contentPadding: const EdgeInsets.only(right: 45),
                          hintStyle: GoogleFonts.openSans(
                            color: kColor4,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("private key hide on off");
                        controller.turnOnOffHiddenPassword();
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Obx(() => Icon(
                                controller.isHidePassword.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: kColor4,
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              RoundedLoadingButton(
                borderRadius: 35,
                height: 55,
                width: 330,
                color: kColor4,
                successColor: kColor4,
                controller: controller.btnController,
                onPressed: () => controller.getAddress(),
                child: Text(
                  "Đăng nhập".toUpperCase(),
                  style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Bạn là người dùng mới ?",
                    style: GoogleFonts.openSans(
                      color: kColor4,
                      fontSize: 15,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print("tap");
                      controller.resetValue();
                      controller.checkMetaMaskInstalled(context);
                    },
                    child: Text(
                      " Đăng ký Metamask",
                      style: GoogleFonts.openSans(
                        color: kColor4,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
