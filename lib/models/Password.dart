class Password{
  String id;
  List<int> positions;

  Password({
    required this.id,
    required this.positions
  });

  factory Password.fromJson(Map<String, dynamic> json) {
    return Password(
      id: json['uuid'],
      positions: json['positions'].toString()
          .split('/')
          .where((element) => element.isNotEmpty)
          .map(int.parse)
          .toList(),
    );
  }
}