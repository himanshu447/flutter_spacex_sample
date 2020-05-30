import 'dart:convert';

import 'package:flutterspacexsample/capsule/model/capsule_model.dart';
import 'package:flutterspacexsample/utils/constant_utils.dart';
import 'package:flutterspacexsample/utils/exception_utils.dart';
import 'package:http/http.dart' as http;

class CapsuleRepository {
  final client = http.Client();

  Future<List<CapsuleModel>> fetchCapsules({int offset = 0}) async {
    var queryParameters = {
      'limit': '5',
      'offset' : offset.toString(),
    };

    var uri = Uri.parse('${ConstantUtils.host_api}capsules');

    var response = await client.get(uri.replace(queryParameters: queryParameters));

    if (response.statusCode == 200) {
      var convertJson = jsonDecode(response.body);

      return (convertJson as List)
          .map((el) => CapsuleModel.fromMap(el as Map<String, dynamic>))
          .toList();
    }

    throw FailToLoadDataException();
  }
}
