import 'package:brainshield/data/models/picture.dart';
import 'package:brainshield/data/remote/eth_provider.dart';
import 'package:get/get.dart';

class ExplorerController extends GetxController {
  List<Picture> allPicture = [];

  @override
  void onInit() {
    super.onInit(); 
    allPicture = EthProvider().listPicture;
  }

  getListPicture() async {
    allPicture = await EthProvider().getPictureList();
  }
}
