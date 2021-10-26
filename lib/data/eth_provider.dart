import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

class EthProvider {
  Client? httpClient;
  Web3Client? ethClient;
  Credentials? _credentials;
  EthereumAddress? _ownAddress;

  Future<void> getCredentials(String privateKey) async {
    _credentials = EthPrivateKey.fromHex(privateKey);
    _ownAddress = await _credentials!.extractAddress();
    print(_ownAddress!.addressBytes);
  }
}
