import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testflutter/constant/strings.dart';

class UserInformationWebservices {
  late Dio dio;
  UserInformationWebservices() {}

  Future<Map<String, dynamic>> getAllUserInformation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    if (token != null) {
      BaseOptions options = BaseOptions(
          baseUrl: baseUrl,
          receiveDataWhenStatusError: true,
          connectTimeout: 20 * 1000,
          receiveTimeout: 20 * 1000,
          headers: {
            "authorization": "Bearer " + token,
          });
      dio = Dio(options);

      try {
        Response response = await dio.get('v3/users/45550949');

        Map<String, dynamic> ret = jsonDecode(response.toString());

        return ret;
      } catch (e) {
        print(e.toString());
        return {};
      }
    } else {
      return {};
    }
  }
}
