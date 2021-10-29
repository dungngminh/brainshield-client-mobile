import 'package:brainshield/modules/account/account_controller.dart';
import 'package:brainshield/core/theme.dart';
import 'package:brainshield/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountScreen extends GetWidget<AccountController> {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () => controller.getBalance(),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 45.0),
            child: Stack(
              children: [
                ListView(),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          splashRadius: 20,
                         
                          onPressed: () => Get.back(),
                          icon: Icon(Icons.arrow_back, color: kColor4),
                        ),
                        IconButton(
                          splashRadius: 20,
                          onPressed: () => controller.showQRCode(context),
                          icon: Icon(Icons.qr_code, color: kColor4),
                        ),
                      ],
                    ),
                    Text(
                      "địa chỉ".toUpperCase(),
                      style: GoogleFonts.openSans(
                        fontSize: 28,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 75,
                      width: 75,
                      child: Image.asset("assets/blank.png"),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Obx(
                      () => Text(
                        (controller.address.value.substring(0, 5) +
                            "..." +
                            controller.address.value.substring(
                                controller.address.value.length - 5,
                                controller.address.value.length - 1)),
                        style: GoogleFonts.openSans(
                          fontSize: 24,
                        ),
                      ),
                    ),
                    IconButton(
                      splashRadius: 20,
                      onPressed: () => controller.copyAddress(),
                      icon: Icon(Icons.copy),
                    ),
                    SizedBox(
                      height: 120,
                      width: 330,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: kColor4,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Số dư".toUpperCase(),
                                style: GoogleFonts.openSans(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Obx(() {
                                final status = controller.status.value;
                                if (status == Status.loading) {
                                  return CircularProgressIndicator(
                                    color: Colors.white,
                                  );
                                } else {
                                  return Text(
                                    "${controller.balance.value.toPrecision(4)} ETH",
                                    style: GoogleFonts.openSans(
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                }
                              }),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed(AppRoutes.rMyProduct),
                      child: Container(
                        height: 55,
                        width: 200,
                        decoration: BoxDecoration(
                          border: Border.all(color: kColor4),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                            child: Text(
                          "Sản phẩm của tôi",
                          style: GoogleFonts.openSans(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () => controller.openURl(),
                      child: Container(
                        height: 55,
                        width: 200,
                        decoration: BoxDecoration(
                          border: Border.all(color: kColor4),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                            child: Text(
                          "Xem trên Etherscan",
                          style: GoogleFonts.openSans(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed(AppRoutes.rSignIn),
                      child: Container(
                        height: 55,
                        width: 200,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                            child: Text(
                          "Thay đổi địa chỉ",
                          style: GoogleFonts.openSans(
                            fontSize: 15,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
