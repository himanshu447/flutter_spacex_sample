import 'package:flutterspacexsample/launches/model/launch_site_model.dart';
import 'package:intl/intl.dart';

class LaunchModel {
  final int _flight_number;
  final String _mission_name;
  final String _launch_year;
  final DateTime _launch_date_utc;
  final DateTime _launch_date_local;
  final List<String> _mission_id;
  final List<String> _ships;
  final String _details;
  final LaunchSite _launchSite;

  LaunchModel({
    int flight_number,
    String mission_name,
    String launch_year,
    DateTime launch_date_utc,
    DateTime launch_date_local,
    List<String> mission_id,
    List<String> ships,
    String details,
    LaunchSite launchSite,
  })  : _flight_number = flight_number,
        _mission_name = mission_name,
        _launch_year = launch_year,
        _launch_date_utc = launch_date_utc,
        _launch_date_local = launch_date_local,
        _mission_id = mission_id,
        _ships = ships,
        _details = details,
        _launchSite = launchSite;

  factory LaunchModel.fromMap(Map<String, dynamic> map) {
    return LaunchModel(
      flight_number: map['flight_number'] != null
          ? (map['flight_number'] as num).toInt()
          : null,
      mission_name: map['mission_name'] != null ? map['mission_name'] : null,
      launch_year: map['launch_year'] != null ? map['launch_year'] : null,
      details: map['details'] != null ? map['details'] : null,
      launchSite: map['launch_site'] != null
          ? LaunchSite.fromMap(map['launch_site'])
          : null,
      ships: map['ships'] != null
          ? (map['ships'] as List).map((el) => el.toString()).toList()
          : null,
      mission_id: map['mission_id'] != null
          ? (map['mission_id'] as List).map((el) => el.toString()).toList()
          : null,
      launch_date_local: map['launch_date_local'] != null
          ? DateFormat('yyyy').parse(map['launch_date_local'])
          : null,
      launch_date_utc: map['launch_date_utc'] != null
          ? DateFormat('yyyy').parse(map['launch_date_utc'])
          : null,
    );
  }

  LaunchSite get launchSite => _launchSite;

  String get details => _details;

  List<String> get ships => _ships;

  List<String> get mission_id => _mission_id;

  DateTime get launch_date_local => _launch_date_local;

  DateTime get launch_date_utc => _launch_date_utc;

  String get launch_year => _launch_year;

  String get mission_name => _mission_name;

  int get flight_number => _flight_number;
}
