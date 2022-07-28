import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:sapyangyuen/api/model/model_province.dart';

class CallAPI {
  final besturl =
      'https://raw.githubusercontent.com/kongvut/thai-province-data/master';
  Future<ModelProvince?> GetapiProvince() async {
    try {
      final response =
          await http.get(Uri.parse("${besturl}/api_province.json"));

      if (response.statusCode == 200) {
        final rs = json.decode(response.body);
        //print(ModelProvince.fromJson(rs[0]));
        print(response.body);
        return ModelProvince.fromJson(rs[0]);
      } else {
        print("ติดต่อเซิฟเวอร์ไม่ได้");
        throw Exception('ติดต่อเซิฟเวอร์ไม่ได้');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<String> GetapiDistrict() async {
    try {
      final response = await http.get(Uri.parse("${besturl}/api_amphure.json"));

      if (response.statusCode == 200) {
        print(response.body);
        return response.body;
      } else {
        print("ติดต่อเซิฟเวอร์ไม่ได้");
        return 'ติดต่อเซิฟเวอร์ไม่ได้';
      }
    } catch (e) {
      print(e);
      return 'failed';
    }
  }
}
