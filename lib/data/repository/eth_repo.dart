import 'package:brainshield/data/remote/eth_provider.dart';

class EthRepository {
  Future<String> votePicture(int id) {
    return EthProvider().votePicture(BigInt.from(id));
  }

  Future<String> createPicture(
      String ipfsInfo, String name, String description, int vote) {
    return EthProvider()
        .createPicture(ipfsInfo, name, description, BigInt.from(vote));
  }

  Future<String> donateForAuthor(String toAddress, double value) {
    return EthProvider().donateForAuthor(toAddress, value);
  }
}
