import 'package:brainshield/core/theme.dart';
import 'package:brainshield/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    this.isHomePage = true,
    required this.isSignIn,
  }) : super(key: key);

  final bool isHomePage;
  final bool isSignIn;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => isHomePage ? {} : Get.toNamed(AppRoutes.rHome),
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
        Row(
          children: [
            isSignIn
                ? IconButton(
                    splashRadius: 24.0,
                    onPressed: () => Get.toNamed(AppRoutes.rAddProduct),
                    icon: Icon(Icons.upload_file, color: kColor4),
                  )
                : SizedBox(),
            SizedBox(
              width: 5,
            ),
            GestureDetector(
              onTap: () => isSignIn
                  ? Get.toNamed(AppRoutes.rAccount)
                  : Get.toNamed(AppRoutes.rSignIn),
              child: CircleAvatar(
                backgroundImage: isSignIn
                    ? Image.asset('assets/blank.png').image
                    : Image.asset('assets/metamask.png').image,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
