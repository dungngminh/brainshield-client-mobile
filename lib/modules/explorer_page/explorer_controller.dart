import 'package:brainshield/data/models/picture.dart';
import 'package:brainshield/data/remote/eth_provider.dart';
import 'package:get/get.dart';

enum Status { loading, error, done }

class ExplorerController extends GetxController {
  List<Picture> allPicture = <Picture>[];
  var status = Status.loading.obs;
  String address = "";
  var isSignIn = false.obs;

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
}
