import 'package:badges/badges.dart';
import 'package:brainshield/core/theme.dart';
import 'package:brainshield/modules/explorer_page/explorer_controller.dart';
import 'package:brainshield/widgets/detail_product.dart';
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
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
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
                Obx(() => Header(
                      isHomePage: false,
                      isSignIn: controller.isSignIn.value,
                    )),
                SizedBox(
                  height: 5,
                ),
                Obx(() {
                  final status = controller.status.value;
                  if (status == Status.loading) {
                    return Expanded(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: kColor4,
                        ),
                      ),
                    );
                  } else if (status == Status.error) {
                    return Expanded(
                      child: Center(
                        child: Icon(Icons.error),
                      ),
                    );
                  } else {
                    return Expanded(
                      child: AnimationLimiter(
                        child: ListView.separated(
                          itemCount: controller.allPicture.length,
                          itemBuilder: (BuildContext context, int index) {
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(seconds: 1),
                              child: SlideAnimation(
                                verticalOffset: 50.0,
                                child: FadeInAnimation(
                                  child: GestureDetector(
                                    onTap: () => Get.to(
                                      () => DetailProduct(
                                        ipfsInfo: controller
                                            .allPicture[index].ipfsInfo,
                                        accountAddress: controller
                                            .allPicture[index].accountAddress,
                                        name: controller.allPicture[index].name,
                                        description: controller
                                            .allPicture[index].description,
                                        vote: controller.allPicture[index].vote,
                                      ),
                                    ),
                                    child: SizedBox(
                                      height: 280,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade200,
                                              offset: Offset(0, 0.5),
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
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 15.0,
                                                  vertical: 10,
                                                ),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    CachedNetworkImage(
                                                      imageUrl:
                                                          "https://ipfs.infura.io/ipfs/${controller.allPicture[index].ipfsInfo}",
                                                      imageBuilder: (context,
                                                              imageProvider) =>
                                                          Container(
                                                        height: 200,
                                                        width: 170,
                                                        decoration:
                                                            BoxDecoration(
                                                          image: DecorationImage(
                                                              image:
                                                                  imageProvider,
                                                              fit: BoxFit
                                                                  .contain),
                                                        ),
                                                      ),
                                                      progressIndicatorBuilder:
                                                          (context, string,
                                                              progress) {
                                                        return SizedBox(
                                                          height: 200,
                                                          width: 170,
                                                          child: Center(
                                                            child:
                                                                CircularProgressIndicator(
                                                              value: progress
                                                                  .progress,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      errorWidget: (context,
                                                              string,
                                                              dymamic) =>
                                                          SizedBox(
                                                        height: 200,
                                                        width: 170,
                                                        child: Center(
                                                          child:
                                                              Icon(Icons.error),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 14,
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Center(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                horizontal:
                                                                    10.0,
                                                              ),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  CircleAvatar(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .white,
                                                                    backgroundImage:
                                                                        Image.asset("assets/blank.png")
                                                                            .image,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Flexible(
                                                                    fit: FlexFit
                                                                        .loose,
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
                                                                            FontWeight.w600,
                                                                        fontSize:
                                                                            17,
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
                                                                .allPicture[
                                                                    index]
                                                                .name,
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: GoogleFonts
                                                                .openSans(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Text(
                                                            controller
                                                                .allPicture[
                                                                    index]
                                                                .description,
                                                            maxLines: 4,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: GoogleFonts
                                                                .openSans(
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
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Badge(
                                                            badgeContent: Text(
                                                              "${controller.allPicture[index].vote}",
                                                              style: GoogleFonts
                                                                  .openSans(
                                                                      color: Colors
                                                                          .white),
                                                            ),
                                                            child: Icon(
                                                                Icons.favorite,
                                                                color: Colors
                                                                    .pink),
                                                          ),
                                                        ],
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
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 15,
                            );
                          },
                        ),
                      ),
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
