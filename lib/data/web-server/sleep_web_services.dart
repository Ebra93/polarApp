import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testflutter/constant/strings.dart';

class SleepWebServices {
  late Dio dio;
  SleepWebServices() {}
  Future<Map<String, dynamic>> getAllSleepInformation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    if (token != null) {
      BaseOptions options = BaseOptions(
          baseUrl: baseUrl,
          responseType: ResponseType.plain,
          receiveDataWhenStatusError: true,
          connectTimeout: 20 * 1000,
          receiveTimeout: 20 * 1000,
          headers: {
            "authorization": "Bearer " + token,
          });
      dio = Dio(options);
      try {
        print("Before Request");
        Response response = await dio.get('v3/users/sleep');
        print("After Request");
        Map<String, dynamic> ret = jsonDecode(response.toString());
        return ret;
      } catch (e) {
        print(e.toString());
        return {};
      }
    } else {
      print("Token existiert nicht");
      return {};
    }
  }
}
