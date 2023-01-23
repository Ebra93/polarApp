import 'package:testflutter/data/models/activity.dart';
import 'package:testflutter/data/web-server/activityList_web_services.dart';

class ActivityRepository {
  final ActivityListWebServices activityListWebServices;

  ActivityRepository(this.activityListWebServices);

  Future<List<Activity>> getAllActivity() async {
    //final exercises = await ExerscisesWebServises().getExerscises();
    final activities = await ActivityListWebServices().getAllUserActivity();
    List<Activity> AllActivities = [];
    activities
        .forEach((key, value) => AllActivities.add(Activity.fromJson(value)));
    return AllActivities;
  }
}
