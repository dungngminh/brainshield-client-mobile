import 'package:brainshield/core/theme.dart';
import 'package:brainshield/modules/my_product/my_product_controller.dart';
import 'package:brainshield/widgets/detail_product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MyProductScreen extends GetView<MyProductController> {
  const MyProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 45.0, bottom: 20),
        child: Column(
          children: [
            Row(children: [
              IconButton(
                splashRadius: 20,
                onPressed: () => Get.back(),
                icon: Icon(Icons.arrow_back, color: kColor4),
              ),
            ]),
            SizedBox(
              height: 5,
            ),
            Text(
              "Sản phẩm của tôi".toUpperCase(),
              style: GoogleFonts.openSans(
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Obx(() {
              final status = controller.status.value;
              if (status == Status.loading) {
                return Expanded(
                    child: Center(
                  child: CircularProgressIndicator(),
                ));
              } else {
                return controller.myList.isEmpty
                    ? Expanded(
                        child: Center(
                          child: Text(
                            "Bạn chưa có sản phẩm nào",
                            style: GoogleFonts.openSans(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                    : Expanded(
                        child: AnimationLimiter(
                          child: ListView.separated(
                            itemCount: controller.myList.length,
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
                                          ipfsInfo:
                                              controller.myList[index].ipfsInfo,
                                          accountAddress: controller
                                              .myList[index].accountAddress,
                                          name: controller.myList[index].name,
                                          description: controller
                                              .myList[index].description,
                                          vote: controller.myList[index].vote,
                                          isExplorerPage: false,
                                        ),
                                      ),
                                      child: SizedBox(
                                        height: 230,
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(25),
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
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 15.0,
                                                    vertical: 10,
                                                  ),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        height: 200,
                                                        width: 170,
                                                        decoration:
                                                            BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                            image:
                                                                CachedNetworkImageProvider(
                                                              "https://ipfs.infura.io/ipfs/${controller.myList[index].ipfsInfo}",
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
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(
                                                              controller
                                                                  .myList[index]
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
                                                                  .myList[index]
                                                                  .description,
                                                              maxLines: 5,
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
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
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
    );
  }
}
