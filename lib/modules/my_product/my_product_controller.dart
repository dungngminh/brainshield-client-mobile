import 'package:brainshield/data/models/picture.dart';
import 'package:brainshield/data/remote/eth_provider.dart';
import 'package:get/get.dart';

enum Status { loading, error, done }

class MyProductController extends GetxController {
  List<Picture> myList = [];
  var status = Status.loading.obs;

  @override
  void onInit() {
    super.onInit();
    myList = EthProvider().getMyAccountPicture();
    update();
    status(Status.done);
  }
}
