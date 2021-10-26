import 'package:brainshield/core/theme.dart';
import 'package:brainshield/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    this.isHomePage = true,
  }) : super(key: key);

  final bool isHomePage;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => isHomePage ? {} : Get.back(),
          child: Row(
            children: [
              SizedBox(
                height: 45,
                width: 45,
                child: CircleAvatar(
                  backgroundImage: Image.asset("assets/logo.png").image,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                "Brainshield",
                style: GoogleFonts.openSans(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: kColor8,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => Get.toNamed(AppRoutes.rSignIn),
          child: SizedBox(
            width: 45,
            height: 45,
            child: CircleAvatar(
              backgroundImage: Image.asset('assets/metamask.png').image,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
        ),
      ],
    );
  }
}
