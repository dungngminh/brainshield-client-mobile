import 'package:brainshield/core/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart';

class DetailProduct extends StatelessWidget {
  const DetailProduct({
    Key? key,
    required this.ipfsInfo,
    required this.accountAddress,
    required this.name,
    required this.description,
    required this.vote,
    this.isExplorerPage = true,
  }) : super(key: key);

  final String ipfsInfo;
  final String accountAddress;
  final String name;
  final String description;
  final int vote;
  final bool isExplorerPage;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Icon(Icons.arrow_back, color: kColor4),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Badge(
                        badgeContent: Text(
                          "$vote",
                          style: GoogleFonts.openSans(color: Colors.white),
                        ),
                        child: Icon(Icons.favorite, color: Colors.pink),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(name.toUpperCase(),
                    style: GoogleFonts.openSans(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center),
                SizedBox(
                  height: 10,
                ),
                CachedNetworkImage(
                  imageUrl: "https://ipfs.infura.io/ipfs/$ipfsInfo",
                  imageBuilder: (context, imageProvider) => Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  progressIndicatorBuilder: (context, string, progress) {
                    return SizedBox(
                      height: 200,
                      width: 170,
                      child: Center(
                        child: CircularProgressIndicator(
                          value: progress.progress,
                        ),
                      ),
                    );
                  },
                  errorWidget: (context, string, dymamic) => SizedBox(
                    height: 200,
                    width: 170,
                    child: Center(
                      child: Icon(Icons.error),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                isExplorerPage
                    ? Column(
                        children: [
                          Text(
                            "Được đăng tải bởi",
                            style: GoogleFonts.openSans(
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            height: 30,
                            width: 30,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage:
                                  Image.asset("assets/blank.png").image,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            accountAddress.substring(0, 5) +
                                "..." +
                                accountAddress.substring(
                                    accountAddress.length - 5,
                                    accountAddress.length - 1),
                            style: GoogleFonts.openSans(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ],
                      )
                    : SizedBox(),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  indent: 20,
                  endIndent: 20,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  "Câu chuyện đằng sau sản phẩm:".toUpperCase(),
                  style: GoogleFonts.openSans(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  description,
                  style: GoogleFonts.openSans(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
