import 'package:brainshield/core/theme.dart';
import 'package:brainshield/modules/sign_in/sign_in_controller.dart';
import 'package:brainshield/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          padding: const EdgeInsets.only(top: 45, left: 40, right: 40),
          child: Column(
            children: [
              SizedBox(
                height: 283,
                width: 317,
                child: SvgPicture.asset("assets/app1.svg"),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Đăng nhập".toUpperCase(),
                    style: GoogleFonts.openSans(
                      fontSize: 24,
                      color: kMainColor,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: kSecondColor,
                  ),
                  child: TextFormField(
                    style: GoogleFonts.openSans(
                      color: kMainColor,
                      fontWeight: FontWeight.w600,
                      textBaseline: TextBaseline.alphabetic,
                    ),
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      fillColor: kMainColor,
                      prefixIcon: Icon(
                        Icons.person,
                        color: kMainColor,
                      ),
                      hintText: 'Email...',
                      contentPadding: const EdgeInsets.only(right: 40),
                      border: InputBorder.none,
                      hintStyle: GoogleFonts.openSans(
                        color: kMainColor,
                        fontWeight: FontWeight.w500,
                        textBaseline: TextBaseline.alphabetic,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: kSecondColor,
                  ),
                  child: Stack(
                    children: [
                      Obx(
                        () => TextFormField(
                          controller: controller.passwordController,
                          style: GoogleFonts.openSans(
                            color: kMainColor,
                            fontWeight: FontWeight.w600,
                            textBaseline: TextBaseline.alphabetic,
                          ),
                          textAlignVertical: TextAlignVertical.center,
                          obscureText: controller.isHidePassword.value,
                          decoration: InputDecoration(
                            fillColor: kMainColor,
                            prefixIcon: Icon(
                              Icons.lock,
                              color: kMainColor,
                            ),
                            hintText: 'Password...',
                            contentPadding: const EdgeInsets.only(right: 40),
                            border: InputBorder.none,
                            hintStyle: GoogleFonts.openSans(
                              color: kMainColor,
                              fontWeight: FontWeight.w500,
                              textBaseline: TextBaseline.alphabetic,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("password hide on off");
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
                                  color: kMainColor,
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              RoundedLoadingButton(
                borderRadius: 35,
                height: 55,
                width: 330,
                color: kMainColor,
                successColor: kMainColor,
                controller: controller.btnController,
                onPressed: () {},
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
                      color: kMainColor,
                      fontSize: 15,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print("tap");
                      controller.resetValue();
                      Get.toNamed(AppRoutes.rSignUp);
                    },
                    child: Text(
                      " Đăng ký",
                      style: GoogleFonts.openSans(
                        color: kMainColor,
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
