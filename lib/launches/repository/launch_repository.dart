import 'dart:convert';

import 'package:flutterspacexsample/launches/model/launch_model.dart';
import 'package:flutterspacexsample/utils/constant_utils.dart';
import 'package:flutterspacexsample/utils/exception_utils.dart';
import 'package:http/http.dart' as http;

class LaunchRepository {
  final client = http.Client();

  Future<LaunchModel> fetchLatestLaunch() async {
    
    var uri = Uri.parse('${ConstantUtils.host_api}launches/latest');

    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var convertJson = jsonDecode(response.body);

      return LaunchModel.fromMap(convertJson as Map<String, dynamic>);
    }

    throw FailToLoadDataException();
  }

  Future<List<LaunchModel>> fetchUpcomingLaunch({int offset = 0}) async {
    var queryParameters = {
      'limit': '5',
      'offset': offset.toString(),
    };

    var uri = Uri.parse('${ConstantUtils.host_api}launches/upcoming');

    var response =
        await client.get(uri.replace(queryParameters: queryParameters));

    if (response.statusCode == 200) {
      var convertJson = jsonDecode(response.body);

      return (convertJson as List)
          .map((el) => LaunchModel.fromMap(el as Map<String, dynamic>))
          .toList();
    }

    throw FailToLoadDataException();
  }

  Future<List<LaunchModel>> fetchPastLaunch({int offset = 0}) async {
    var queryParameters = {
      'limit': '5',
      'offset': offset.toString(),
    };

    var uri = Uri.parse('${ConstantUtils.host_api}launches/past');

    var response =
        await client.get(uri.replace(queryParameters: queryParameters));

    if (response.statusCode == 200) {
      var convertJson = jsonDecode(response.body);

      return (convertJson as List)
          .map((el) => LaunchModel.fromMap(el as Map<String, dynamic>))
          .toList();
    }

    throw FailToLoadDataException();
  }
}
