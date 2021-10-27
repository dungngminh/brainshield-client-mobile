import 'dart:io';

import 'package:brainshield/core/theme.dart';
import 'package:brainshield/data/ipfs_repo.dart';
import 'package:brainshield/data/remote/eth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

enum Status { loading, error, done }

class AccountController extends GetxController {
  var address = "".obs;
  var balance = "".obs;
  final status = Status.loading.obs;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();


  String? category;
  File? file;
  PlatformFile? platformFile;

  @override
  void onReady() {
    super.onInit();
    address.value = EthProvider().address!;
  }

  getBalance() async {
    await EthProvider().getBalance().then((value) {
      balance("$value");
      status(Status.done);
    });
    update();
  }



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
              color: kColor4,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    } else {
      String hashCodeImage =
          await IPFSRepository().uploadImage(platformFile!.name, file!);
      await EthProvider().createPicture(hashCodeImage, nameController.text,
          descriptionController.text, BigInt.from(0));
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
