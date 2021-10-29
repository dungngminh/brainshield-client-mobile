import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:brainshield/core/theme.dart';
import 'package:brainshield/modules/home/home_controller.dart';
import 'package:brainshield/routes/app_pages.dart';
import 'package:brainshield/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 15, right: 15),
            child: Column(
              children: [
                Obx(() => Header(isSignIn: controller.isSignIn.value)),
                SizedBox(
                  height: 240,
                ),
                AnimationLimiter(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: AnimationConfiguration.toStaggeredList(
                      duration: const Duration(seconds: 1),
                      childAnimationBuilder: (widget) => SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: widget,
                        ),
                      ),
                      children: [
                        AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'BRAINSHIELD',
                              cursor: "",
                              speed: Duration(milliseconds: 70),
                              textStyle: GoogleFonts.openSans(
                                fontSize: 45,
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
                          "Ứng dụng bảo vệ quyền sở hữu tác giả\ndành cho trẻ em.",
                          style: GoogleFonts.openSans(
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Tooltip(
                                message: "Lead",
                                child: CircleAvatar(
                                  backgroundImage:
                                      Image.asset('assets/avatar/namphuong.jpg')
                                          .image,
                                ),
                              ),
                              Spacer(),
                              Tooltip(
                                message: "Backend",
                                child: CircleAvatar(
                                  backgroundImage:
                                      Image.asset('assets/avatar/duc.jpg')
                                          .image,
                                ),
                              ),
                              Spacer(),
                              Tooltip(
                                message: "Frontend",
                                child: CircleAvatar(
                                  backgroundImage:
                                      Image.asset('assets/avatar/linh.jpg')
                                          .image,
                                ),
                              ),
                              Spacer(),
                              Tooltip(
                                message: "Mobile",
                                child: CircleAvatar(
                                  backgroundImage:
                                      Image.asset('assets/avatar/dung.jpg')
                                          .image,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        GestureDetector(
                          onVerticalDragDown: (detail) =>
                              Get.toNamed(AppRoutes.rExplorer),
                          onTap: () => Get.toNamed(AppRoutes.rExplorer),
                          child: Column(
                            children: [
                              Text(
                                "Khám phá sản phẩm",
                                style: GoogleFonts.openSans(
                                    fontStyle: FontStyle.italic),
                              ),
                              Icon(Icons.expand_more, size: 26.0),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
