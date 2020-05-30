class Mission {
  final String _mission_name;
  final String _mission_id;
  final List<String> _manufacturers;
  final List<String> _payload_ids;
  final String _wikipedia;
  final String _website;
  final String _twitter;
  final String _description;

  Mission({
    String mission_name,
    String mission_id,
    List<String> manufacturers,
    List<String> payload_ids,
    String wikipedia,
    String website,
    String twitter,
    String description,
  })  : _mission_name = mission_name,
        _mission_id = mission_id,
        _manufacturers = manufacturers,
        _payload_ids = payload_ids,
        _wikipedia = wikipedia,
        _website = website,
        _twitter = twitter,
        _description = description;

  factory Mission.fromMap(Map<String, dynamic> map) {
    return Mission(
      mission_name: map['mission_name'] != null ? map['mission_name'] : null,
      mission_id: map['mission_id'] != null ? map['mission_id'] : null,
      wikipedia: map['wikipedia'] != null ? map['wikipedia'] : null,
      website: map['website'] != null ? map['website'] : null,
      twitter: map['twitter'] != null ? map['twitter'] : null,
      description: map['description'] != null ? map['description'] : null,
      manufacturers: map['manufacturers'] != null
          ? (map['manufacturers'] as List).map((e) => e.toString()).toList()
          : null,
      payload_ids: map['payload_ids'] != null
          ? (map['payload_ids'] as List).map((e) => e.toString()).toList()
          : null,
    );
  }

  String get description => _description;

  String get twitter => _twitter;

  String get website => _website;

  String get wikipedia => _wikipedia;

  List<String> get payload_ids => _payload_ids;

  List<String> get manufacturers => _manufacturers;

  String get mission_id => _mission_id;

  String get mission_name => _mission_name;
	
	
}
