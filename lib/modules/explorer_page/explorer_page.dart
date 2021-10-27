import 'package:brainshield/core/theme.dart';
import 'package:brainshield/modules/explorer_page/explorer_controller.dart';
import 'package:brainshield/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ExplorerPage extends GetView<ExplorerController> {
  const ExplorerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 40.0,
          left: 15,
          right: 15,
          bottom: 10,
        ),
        child: Column(
          children: [
            Header(isHomePage: false),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: AnimationLimiter(
                child: ListView.separated(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(seconds: 1),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: SizedBox(
                            height: 280,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 220,
                                    margin: EdgeInsets.only(top: 10),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0,
                                        vertical: 10,
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 200,
                                            width: 170,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: Image.network(
                                                        "https://bafybeif4hfbzadgqmy4a6rjmb7lgrn7w3rbocng3iuqjc3cmqn6v7irhfm.ipfs.infura-ipfs.io/")
                                                    .image,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 14,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Center(
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 10.0,
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        CircleAvatar(
                                                          backgroundImage:
                                                              Image.network(
                                                                      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png")
                                                                  .image,
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Flexible(
                                                          fit: FlexFit.loose,
                                                          child: Text(
                                                            "User",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: GoogleFonts
                                                                .openSans(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 17,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "Card title",
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.openSans(
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                                  maxLines: 5,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.openSans(
                                                    fontSize: 15,
                                                    color: kColor9,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                    child: Center(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.thumb_up_outlined,
                                                color: kColor3,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.coffee_outlined,
                                                color: kColor3,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.save_outlined,
                                                color: kColor3,
                                              ),
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
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
