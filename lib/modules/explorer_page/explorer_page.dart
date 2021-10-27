import 'package:brainshield/core/theme.dart';
import 'package:brainshield/modules/explorer_page/explorer_controller.dart';
import 'package:brainshield/widgets/header.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ExplorerPage extends GetWidget<ExplorerController> {
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
        child: RefreshIndicator(
          onRefresh: () => controller.getListPicture(),
          child: Column(
            children: [
              Header(isHomePage: false),
              SizedBox(
                height: 5,
              ),
              Expanded(
                child: AnimationLimiter(
                  child: GetBuilder<ExplorerController>(builder: (context) {
                    return ListView.separated(
                      itemCount: controller.allPicture.length,
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
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade200,
                                        offset: Offset(-1, 1),
                                        spreadRadius: 2,
                                      )
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 220,
                                        margin: EdgeInsets.only(top: 5),
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
                                                    image:
                                                        CachedNetworkImageProvider(
                                                      "https://ipfs.infura.io/ipfs/${controller.allPicture[index].ipfsInfo}",
                                                    ),
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
                                                                controller
                                                                    .allPicture[
                                                                        index]
                                                                    .accountAddress,
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
                                                      controller
                                                          .allPicture[index].name,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts.openSans(
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      controller.allPicture[index]
                                                          .description,
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
                                                    Icons.favorite,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.coffee,
                                                    color: Colors.brown,
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
                          height: 15,
                        );
                      },
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
