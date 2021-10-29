import 'package:brainshield/data/models/picture.dart';
import 'package:brainshield/data/remote/eth_provider.dart';
import 'package:brainshield/data/repository/eth_repo.dart';
import 'package:brainshield/widgets/my_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

enum Status { loading, error, done }

class ExplorerController extends GetxController {
  List<Picture> allPicture = <Picture>[];
  var status = Status.loading.obs;
  String address = "";
  var isSignIn = false.obs;
  final TextEditingController valueController = TextEditingController();

  @override
  Future<void> onInit() async {
    super.onInit();
    if (EthProvider().address != "") {
      address = EthProvider().address;
    }
    if (address != "") {
      isSignIn.value = true;
    }
    update();
    allPicture = await EthProvider().getPictureList();
    print(allPicture);
    status(Status.done);
    update();
  }

  getListPicture() async {
    status(Status.loading);
    try {
      allPicture = await EthProvider().getPictureList();
      status(Status.done);
    } catch (_) {
      status(Status.error);
    }
  }

  voteProduct(int id, String productAddress, BuildContext context) async {
    if (address == "") {
      MyToast.showToast("Vui lòng nhập tài khoản\nđể thực hiện thao tác");
    } else if (address == productAddress) {
      MyToast.showToast("Bạn không thể vote cho \nsản phẩm của chính mình");
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                title: Text(
                  "Vote sản phẩm",
                  style: GoogleFonts.openSans(fontWeight: FontWeight.w600),
                ),
                content: Text(
                    "Bạn sẽ vote sản phẩm?\nVOTE SẢN PHẨM\nSẼ THỰC HIỆN GIAO DỊCH",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans()),
                actions: [
                  TextButton(
                    onPressed: () async {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                "Đang vote cho sản phẩm",
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w600),
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  SizedBox(height: 10),
                                  CircularProgressIndicator(),
                                ],
                              ),
                            );
                          });
                      await EthRepository().votePicture(id).then((value) {
                        MyToast.showToast("Mã giao dịch:\n" + value);
                        MyToast.showToast("Vote thành công");
                        Get.back();
                        Get.back();
                      }).catchError((_) {
                        MyToast.showToast(
                            "Lỗi trong quá trình thực hiện,\nvui lòng thử lại");
                        Get.back();
                      });
                    },
                    child: Text(
                      "Xác nhận",
                      style: GoogleFonts.openSans(fontWeight: FontWeight.w600),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Get.back(),
                    child: Text(
                      "Hủy",
                      style: GoogleFonts.openSans(fontWeight: FontWeight.w600),
                    ),
                  )
                ]);
          });
    }
  }

  donateForAuthor(String toAddress, BuildContext context) {
    if (address == "") {
      MyToast.showToast("Vui lòng nhập tài khoản\nđể thực hiện thao tác");
    } else {
      if (toAddress == address) {
        MyToast.showToast("Bạn không thể ủng hộ\nsản phẩm của mình");
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                  title: Text(
                    "Nhập số ETH muốn ủng hộ",
                    style: GoogleFonts.openSans(fontWeight: FontWeight.w600),
                  ),
                  content: TextField(
                    controller: valueController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "0.001",
                      hintStyle: GoogleFonts.openSans(),
                      labelText: "Số ETH ủng hộ",
                      labelStyle: GoogleFonts.openSans(),
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () async {
                        if (valueController.text == "") {
                          MyToast.showToast("Vui lòng điền giá trị");
                        } else {
                          FocusManager.instance.primaryFocus?.unfocus();
                          if (double.tryParse(valueController.text) == null) {
                            MyToast.showToast("Vui lòng điền giá trị hợp lệ");
                          } else {
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Đang ủng hộ sản phẩm"),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        SizedBox(height: 10),
                                        CircularProgressIndicator(),
                                      ],
                                    ),
                                  );
                                });
                            await EthRepository()
                                .donateForAuthor(toAddress,
                                    double.tryParse(valueController.text)!)
                                .then((value) {
                              MyToast.showToast("Mã giao dịch:\n" + value);
                              MyToast.showToast("Ủng hộ thành công");
                              valueController.text = "";
                              Get.back();
                              Get.back();
                            }).catchError((_) {
                              MyToast.showToast(
                                  "Lỗi trong quá trình thực hiện,\nvui lòng thử lại");
                              Get.back();
                            });
                          }
                        }
                      },
                      child: Text(
                        "Xác nhận",
                        style:
                            GoogleFonts.openSans(fontWeight: FontWeight.w600),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Get.back(),
                      child: Text(
                        "Hủy",
                        style:
                            GoogleFonts.openSans(fontWeight: FontWeight.w600),
                      ),
                    )
                  ]);
            });
      }
    }
  }
}
