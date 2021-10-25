import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:brainshield/core/theme.dart';
import 'package:brainshield/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0, left: 15, right: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: CircleAvatar(
                        backgroundImage: Image.asset("assets/logo.png").image,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Brainshield",
                      style: GoogleFonts.openSans(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: kColor8,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.rSignIn),
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircleAvatar(
                      backgroundImage: Image.asset('assets/metamask.png').image,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 240,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'BRAINSHIELD',
                      speed: Duration(milliseconds: 60),
                      textStyle: GoogleFonts.openSans(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            offset: Offset(-3.0, 3.0),
                            // blurRadius: 2.0,
                            color: kColor2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Application transparency of copyright ownership by blockchain technology and NFT.",
                  style: GoogleFonts.openSans(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Tooltip(
                        message: "Lead",
                        child: CircleAvatar(
                          backgroundImage:
                              Image.asset('assets/avatar/namphuong.jpg').image,
                        ),
                      ),
                      Spacer(),
                      Tooltip(
                        message: "Backend",
                        child: CircleAvatar(
                          backgroundImage:
                              Image.asset('assets/avatar/duc.jpg').image,
                        ),
                      ),
                      Spacer(),
                      Tooltip(
                        message: "Frontend",
                        child: CircleAvatar(
                          backgroundImage:
                              Image.asset('assets/avatar/linh.jpg').image,
                        ),
                      ),
                      Spacer(),
                      Tooltip(
                        message: "Mobile",
                        child: CircleAvatar(
                          backgroundImage:
                              Image.asset('assets/avatar/dung.jpg').image,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
