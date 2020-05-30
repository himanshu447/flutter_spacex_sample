import 'dart:convert';

import 'package:flutterspacexsample/mission/model/mission_model.dart';
import 'package:flutterspacexsample/utils/constant_utils.dart';
import 'package:flutterspacexsample/utils/exception_utils.dart';
import 'package:http/http.dart' as http;

class MissionRepository {
  final client = http.Client();

  Future<List<MissionModel>> fetchMissions({int offset = 0}) async {
    var queryParameters = {
      'limit': '5',
      'offset': offset.toString(),
    };

    var uri = Uri.parse('${ConstantUtils.host_api}missions');

    var response =
        await client.get(uri.replace(queryParameters: queryParameters));

    if (response.statusCode == 200) {
      var convertJson = jsonDecode(response.body);

      return (convertJson as List)
          .map((el) => MissionModel.fromMap(el as Map<String, dynamic>))
          .toList();
    }

    throw FailToLoadDataException();
  }
}
