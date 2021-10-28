import 'dart:io';

import 'package:brainshield/data/repository/ipfs_repo.dart';
import 'package:brainshield/data/remote/eth_provider.dart';
import 'package:brainshield/routes/app_pages.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddProductController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  String? category;
  File? file;
  PlatformFile? platformFile;

  selectFile() async {
    final _file = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['png', 'jpg', 'jpeg']);

    if (_file != null) {
      file = File(_file.files.single.path!);
      platformFile = _file.files.first;
      update();
    }
  }

  createPicture(BuildContext context) async {
    if (nameController.text == "" ||
        descriptionController.text == "" ||
        file == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          content: Text(
            "Vui lòng không được để trống",
            style: GoogleFonts.openSans(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Xác nhận"),
              content: Text(
                "Bạn xác nhận sẽ đăng sản phẩm?\n\nĐĂNG SẢN PHẨM\nSẼ THỰC HIỆN GIAO DỊCH",
                textAlign: TextAlign.center,
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Đang đăng sản phẩm"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                SizedBox(height: 10),
                                CircularProgressIndicator(),
                              ],
                            ),
                          );
                        });
                    String hashCodeImage = await IPFSRepository()
                        .uploadImage(platformFile!.name, file!);
                    await EthProvider()
                        .createPicture(hashCodeImage, nameController.text,
                            descriptionController.text, BigInt.from(0))
                        .then((value) {
                      Fluttertoast.showToast(
                        msg: "Đã upload thành công",
                        toastLength: Toast.LENGTH_SHORT,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                      );
                      Get.back();
                      Get.back();
                    });

                    await Future.delayed(Duration(seconds: 2))
                        .then((value) => Get.offNamed(AppRoutes.rHome));
                  },
                  child: Text("Xác nhận"),
                ),
                TextButton(
                  onPressed: () => Get.back(),
                  child: Text("Hủy"),
                ),
              ],
            );
          });
    }
  }

  removeFile() {
    file = null;
    platformFile = null;
    update();
  }

  categorySelected(String newValue) {
    category = newValue;
    update();
  }
}
