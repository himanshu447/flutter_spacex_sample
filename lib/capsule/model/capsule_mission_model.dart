class Mission {
  final String _name;
  final int _flight;

  Mission({
    String name,
    int flight,
  })  : _name = name,
        _flight = flight;

  factory Mission.fromMap(Map<String, dynamic> map) {
    return Mission(
      flight: map['flight'] != null ? (map['flight'] as num).toInt() : null,
      name: map['name'] != null ? map['name'] : null,
    );
  }

  int get flight => _flight;

  String get name => _name;
	
}
