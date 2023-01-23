import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testflutter/constant/strings.dart';

class ExerscisesWebServises {
  late Dio dio;
  ExerscisesWebServises() {}

  Future<List<dynamic>> getExerscises() async {
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
        Response response = await dio.get('v3/exercises');
        print(response.data);
        List<dynamic> ret = jsonDecode(response.data.toString());

        print("After Request");
        return ret;
      } catch (e) {
        print(e.toString());
        return [];
      }
    } else {
      print("Token existiert nicht");
      return [];
    }
  }
}
