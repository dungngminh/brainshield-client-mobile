
import 'package:http/http.dart' as http;

class IPFSProvider {
  static final IPFSProvider _ = IPFSProvider._internal();

  factory IPFSProvider() {
    return _;
  }

  IPFSProvider._internal();

  Future<String> getPicture(String hash) async {
    var responce =
        await http.post(Uri.parse("https://ipfs.infura.io/ipfs/$hash"));
    if (responce.statusCode == 200) {
      print(responce.body);
      return responce.body;
    } else {
      print(responce.body);
      throw Exception("Can not get picture");
    }
  }
}
