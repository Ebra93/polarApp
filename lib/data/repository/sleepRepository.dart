import 'package:testflutter/constant/strings.dart';
import 'package:testflutter/data/models/sleep.dart';
import 'package:testflutter/data/web-server/sleep_web_services.dart';

class SleepRepository {
  final SleepWebServices sleepWebServices;

  SleepRepository(this.sleepWebServices);

  Future<Sleep> getSleepInformation() async {
    final sleepInformation = await sleepWebServices.getAllSleepInformation();

    return Sleep.fromJson(sleepInformation);

    //return Sleep.fromJson(staticinfo);
  }
}
