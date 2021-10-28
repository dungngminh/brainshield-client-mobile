// Generated code, do not modify. Run `build_runner build` to re-generate!
// @dart=2.12
import 'package:web3dart/web3dart.dart' as _i1;

final _contractAbi = _i1.ContractAbi.fromJson(
    '[{"inputs":[],"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"uint256","name":"id","type":"uint256"},{"indexed":false,"internalType":"string","name":"accountAddress","type":"string"},{"indexed":false,"internalType":"string","name":"ipfsInfo","type":"string"},{"indexed":false,"internalType":"string","name":"name","type":"string"},{"indexed":false,"internalType":"string","name":"description","type":"string"},{"indexed":false,"internalType":"uint256","name":"vote","type":"uint256"}],"name":"PictureCreated","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"uint256","name":"id","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"vote","type":"uint256"}],"name":"PictureVote","type":"event"},{"inputs":[{"internalType":"string","name":"accountAddress","type":"string"},{"internalType":"string","name":"ipfsInfo","type":"string"},{"internalType":"string","name":"name","type":"string"},{"internalType":"string","name":"description","type":"string"},{"internalType":"uint256","name":"vote","type":"uint256"}],"name":"createPicture","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"pictureCount","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"","type":"uint256"}],"name":"pictures","outputs":[{"internalType":"uint256","name":"id","type":"uint256"},{"internalType":"string","name":"accountAddress","type":"string"},{"internalType":"string","name":"ipfsInfo","type":"string"},{"internalType":"string","name":"name","type":"string"},{"internalType":"string","name":"description","type":"string"},{"internalType":"uint256","name":"vote","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"_id","type":"uint256"}],"name":"votePicture","outputs":[],"stateMutability":"nonpayable","type":"function"}]',
    'PictureAssets');

class PictureAssets extends _i1.GeneratedContract {
  PictureAssets(
      {required _i1.EthereumAddress address,
      required _i1.Web3Client client,
      int? chainId})
      : super(_i1.DeployedContract(_contractAbi, address), client, chainId);

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> createPicture(String accountAddress, String ipfsInfo,
      String name, String description, BigInt vote,
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[1];
    assert(checkSignature(function, 'd0d5d99f'));
    final params = [accountAddress, ipfsInfo, name, description, vote];
    return write(credentials, transaction, function, params);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BigInt> pictureCount({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[2];
    assert(checkSignature(function, '89b7e978'));
    final params = [];
    final response = await read(function, params, atBlock);
    return (response[0] as BigInt);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<Pictures> pictures(BigInt $param5, {_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[3];
    assert(checkSignature(function, '4a291142'));
    final params = [$param5];
    final response = await read(function, params, atBlock);
    return Pictures(response);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> votePicture(BigInt _id,
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[4];
    assert(checkSignature(function, '7a40a05c'));
    final params = [_id];
    return write(credentials, transaction, function, params);
  }

  /// Returns a live stream of all PictureCreated events emitted by this contract.
  Stream<PictureCreated> pictureCreatedEvents(
      {_i1.BlockNum? fromBlock, _i1.BlockNum? toBlock}) {
    final event = self.event('PictureCreated');
    final filter = _i1.FilterOptions.events(
        contract: self, event: event, fromBlock: fromBlock, toBlock: toBlock);
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(result.topics!, result.data!);
      return PictureCreated(decoded);
    });
  }

  /// Returns a live stream of all PictureVote events emitted by this contract.
  Stream<PictureVote> pictureVoteEvents(
      {_i1.BlockNum? fromBlock, _i1.BlockNum? toBlock}) {
    final event = self.event('PictureVote');
    final filter = _i1.FilterOptions.events(
        contract: self, event: event, fromBlock: fromBlock, toBlock: toBlock);
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(result.topics!, result.data!);
      return PictureVote(decoded);
    });
  }
}

class Pictures {
  Pictures(List<dynamic> response)
      : id = (response[0] as BigInt),
        accountAddress = (response[1] as String),
        ipfsInfo = (response[2] as String),
        name = (response[3] as String),
        description = (response[4] as String),
        vote = (response[5] as BigInt);

  final BigInt id;

  final String accountAddress;

  final String ipfsInfo;

  final String name;

  final String description;

  final BigInt vote;
}

class PictureCreated {
  PictureCreated(List<dynamic> response)
      : id = (response[0] as BigInt),
        accountAddress = (response[1] as String),
        ipfsInfo = (response[2] as String),
        name = (response[3] as String),
        description = (response[4] as String),
        vote = (response[5] as BigInt);

  final BigInt id;

  final String accountAddress;

  final String ipfsInfo;

  final String name;

  final String description;

  final BigInt vote;
}

class PictureVote {
  PictureVote(List<dynamic> response)
      : id = (response[0] as BigInt),
        vote = (response[1] as BigInt);

  final BigInt id;

  final BigInt vote;
}
