class Exercises {
  late String id;
  late String uploadTime;
  late String polarUser;
  late String device;
  late String deviceId;
  late String startTime;
  late int startTimeUtcOffset;
  late String duration;
  late double? distance;
  late HeartRate heartRate;
  late String sport;
  late bool hasRoute;
  late String detailedSportInfo;
  late int calories;

  Exercises(
      {required this.id,
      required this.uploadTime,
      required this.polarUser,
      required this.device,
      required this.deviceId,
      required this.startTime,
      required this.startTimeUtcOffset,
      required this.duration,
      required this.distance,
      required this.heartRate,
      required this.sport,
      required this.hasRoute,
      required this.detailedSportInfo,
      required this.calories});

  Exercises.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uploadTime = json['upload_time'];
    polarUser = json['polar_user'];
    device = json['device'];
    deviceId = json['device_id'];
    startTime = json['start_time'];
    startTimeUtcOffset = json['start_time_utc_offset'];
    duration = json['duration'];
    distance = json['distance'];
    heartRate = (json['heart_rate'] != null
        ? new HeartRate.fromJson(json['heart_rate'])
        : null)!;
    sport = json['sport'];
    hasRoute = json['has_route'];
    detailedSportInfo = json['detailed_sport_info'];
    calories = json['calories'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['upload_time'] = this.uploadTime;
    data['polar_user'] = this.polarUser;
    data['device'] = this.device;
    data['device_id'] = this.deviceId;
    data['start_time'] = this.startTime;
    data['start_time_utc_offset'] = this.startTimeUtcOffset;
    data['duration'] = this.duration;
    data['distance'] = this.distance;
    if (this.heartRate != null) {
      data['heart_rate'] = this.heartRate.toJson();
    }
    data['sport'] = this.sport;
    data['has_route'] = this.hasRoute;
    data['detailed_sport_info'] = this.detailedSportInfo;
    data['calories'] = this.calories;
    return data;
  }
}

class HeartRate {
  late int average;
  late int maximum;

  HeartRate({required this.average, required this.maximum});

  HeartRate.fromJson(Map<String, dynamic> json) {
    average = json['average'];
    maximum = json['maximum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['average'] = this.average;
    data['maximum'] = this.maximum;
    return data;
  }
}
