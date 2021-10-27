import 'dart:io';

import 'package:brainshield/data/remote/eth_provider.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';

enum Status { loading, error, done }

class AccountController extends GetxController {
  var address = "".obs;
  var pictureCount = "".obs;
  final status = Status.loading.obs;

  File? file;
  PlatformFile? platformFile;

  @override
  void onReady() {
    super.onInit();
    address.value = EthProvider().address!;
  }

  getPictureCount() async {
    await EthProvider().getPictureCount().then((value) {
      pictureCount(value);
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
}
