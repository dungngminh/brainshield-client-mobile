import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

class EthProvider {
  Client? httpClient;
  Web3Client? ethClient;
  Credentials? _credentials;
  EthereumAddress? _ownAddress;
  String? _address;
  String? get address => _address;

  static final EthProvider _ = EthProvider._internal();

  factory EthProvider() {
    return _;
  }

  EthProvider._internal();

  void initProvider() {
    httpClient = Client();
    ethClient = Web3Client(
        "https://ropsten.infura.io/v3/241f03331919423cba6145c7a2bcc61a",
        httpClient!);
  }

  Future<DeployedContract> loadContract(String contractAddress) async {
    String abi =
        await rootBundle.loadString("src/artifacts/PictureAssets.json");
    var jsonAbi = jsonDecode(abi);
    String _abiCode = jsonEncode(jsonAbi["output"]["abi"]);
    final contract = DeployedContract(
      ContractAbi.fromJson(_abiCode, "PictureAssets"),
      EthereumAddress.fromHex(contractAddress),
    );
    return contract;
  }

  Future<String> getCredentials(String privateKey) async {
    _credentials = EthPrivateKey.fromHex(privateKey);
    _ownAddress = await _credentials!.extractAddress();
    _address = _ownAddress.toString();
    return _address!;
  }

  Future<List<dynamic>> query(
      String contractAddress, String functionName, List<dynamic> params) async {
    final contract = await loadContract(contractAddress);
    final ethFunction = contract.function(functionName);
    final result = await ethClient!
        .call(contract: contract, function: ethFunction, params: params);
    return result;
  }

  Future<String> getPictureCount(String contractAddress) async {
    List<dynamic> result = await query(contractAddress, 'pictureCount', []);
    return result[0];
  }
}
