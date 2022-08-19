import 'dart:convert';
import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:sapyangyuen/api/model/model_province.dart';
import 'package:sapyangyuen/api/model/model_register.dart';
import 'package:dio/dio.dart';

class CallAPI {
  final besturl1 =
      'https://raw.githubusercontent.com/kongvut/thai-province-data/master';
  final besturl = 'https://plankton-app-axlmu.ondigitalocean.app/api/';

  Future<List<ModelProvince>?> GetapiProvince() async {
    final response = await http.get(Uri.parse("${besturl1}/api_province.json"));

    if (response.statusCode == 200) {
      var res = response.body;
      var resdata = json.decode(res);
      var resfrom = modelProvinceFromJson(res);
      print("*******ผ่าน");
      print(resfrom);

      return resfrom;
    } else {
      print("ติดต่อเซิฟเวอร์ไม่ได้");
      throw Exception('ติดต่อเซิฟเวอร์ไม่ได้');
    }
  }

  Future<http.Response?> postRegister(data, apiUrl) async {
    http.Response? response;
    
    try {
      Map<String, String> body = data;
      response = await http.post(Uri.parse("${besturl + apiUrl}"),
          headers: {
            "Content-Type": "application/x-www-form-urlencoded",
          },
          encoding: Encoding.getByName('utf-8'),
          body: body,
          );
      if (response.statusCode == 200) {
        return response;
      } else {
        //print(response.body);
        return response;
      }
    } catch (e) {
      log(e.toString());
    }
    
  }


  
}
