import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ActivityListWebServices {
  late Dio dio;
  ActivityListWebServices() {}
  Future<Map<String, dynamic>> getAllUserActivity() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    if (token != null) {
      BaseOptions options = BaseOptions(
          receiveDataWhenStatusError: true,
          connectTimeout: 20 * 1000,
          receiveTimeout: 20 * 1000,
          headers: {
            "authorization": "Bearer " + token,
          });
      dio = Dio(options);
      try {
        Response response = await dio.post(
            'https://www.polaraccesslink.com/v3/users/45550949/activity-transactions');
        print("This is Response" + response.toString());
        if (response.toString() == "") {
          print("Empty");
          return Map();
        }
        Map<String, dynamic> firstresponse = jsonDecode(response.toString());

        String link = firstresponse['resource-uri'];
        print("This is Link" + link);
        Response response1 = await dio.get(link);
        Map<String, dynamic> secondresponse = jsonDecode(response1.toString());
        List<dynamic> activityList = secondresponse["activity-log"];
        Map<String, dynamic> ret = {};
        for (var i = 0; i < activityList.length; i++) {
          Response response2 = await dio.get(activityList[i]);
          Map<String, dynamic> Thirdresponse = jsonDecode(response2.toString());
          ret[i.toString()] = Thirdresponse;
        }
        print("This is the ret" + ret.toString());
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
