class Picture {
  final int id;
  final String accountAddress;
  final String ipfsInfo;
  final String name;
  final String description;
  final BigInt vote;

  Picture({
    required this.id,
    required this.accountAddress,
    required this.ipfsInfo,
    required this.name,
    required this.description,
    required this.vote,
  });
}
