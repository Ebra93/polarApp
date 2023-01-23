import 'package:flutter/material.dart';

class Sleep {
  late List<Nights> nights;

  Sleep({required this.nights});

  Sleep.fromJson(Map<String, dynamic> json) {
    if (json['nights'] != null) {
      nights = <Nights>[];
      json['nights'].forEach((v) {
        nights.add(new Nights.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.nights != null) {
      data['nights'] = this.nights.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Nights {
  late String polarUser;
  late String date;
  late String sleepStartTime;
  late String sleepEndTime;
  late String deviceId;
  late double continuity;
  late int continuityClass;
  late int lightSleep;
  late int deepSleep;
  late int remSleep;
  late int unrecognizedSleepStage;
  late int sleepScore;
  late int totalInterruptionDuration;
  late int sleepCharge;
  late int sleepGoal;
  late int sleepRating;
  late int shortInterruptionDuration;
  late int longInterruptionDuration;
  late int sleepCycles;
  late double groupDurationScore;
  late double groupSolidityScore;
  late double groupRegenerationScore;
  late Map<String, dynamic> hypnogram;
  late Map<String, dynamic> heartRateSamples;

  Nights(
      {required this.polarUser,
      required this.date,
      required this.sleepStartTime,
      required this.sleepEndTime,
      required this.deviceId,
      required this.continuity,
      required this.continuityClass,
      required this.lightSleep,
      required this.deepSleep,
      required this.remSleep,
      required this.unrecognizedSleepStage,
      required this.sleepScore,
      required this.totalInterruptionDuration,
      required this.sleepCharge,
      required this.sleepGoal,
      required this.sleepRating,
      required this.shortInterruptionDuration,
      required this.longInterruptionDuration,
      required this.sleepCycles,
      required this.groupDurationScore,
      required this.groupSolidityScore,
      required this.groupRegenerationScore,
      required this.hypnogram,
      required this.heartRateSamples});

  Nights.fromJson(Map<String, dynamic> json) {
    polarUser = json['polar_user'];
    date = json['date'];
    sleepStartTime = json['sleep_start_time'];
    sleepEndTime = json['sleep_end_time'];
    deviceId = json['device_id'];
    continuity = json['continuity'];
    continuityClass = json['continuity_class'];
    lightSleep = json['light_sleep'];
    deepSleep = json['deep_sleep'];
    remSleep = json['rem_sleep'];
    unrecognizedSleepStage = json['unrecognized_sleep_stage'];
    sleepScore = json['sleep_score'];
    totalInterruptionDuration = json['total_interruption_duration'];
    sleepCharge = json['sleep_charge'];
    sleepGoal = json['sleep_goal'];
    sleepRating = json['sleep_rating'];
    shortInterruptionDuration = json['short_interruption_duration'];
    longInterruptionDuration = json['long_interruption_duration'];
    sleepCycles = json['sleep_cycles'];
    groupDurationScore = json['group_duration_score'];
    groupSolidityScore = json['group_solidity_score'];
    groupRegenerationScore = json['group_regeneration_score'];
    hypnogram = (json['hypnogram']);
    heartRateSamples = json['heart_rate_samples'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['polar_user'] = this.polarUser;
    data['date'] = this.date;
    data['sleep_start_time'] = this.sleepStartTime;
    data['sleep_end_time'] = this.sleepEndTime;
    data['device_id'] = this.deviceId;
    data['continuity'] = this.continuity;
    data['continuity_class'] = this.continuityClass;
    data['light_sleep'] = this.lightSleep;
    data['deep_sleep'] = this.deepSleep;
    data['rem_sleep'] = this.remSleep;
    data['unrecognized_sleep_stage'] = this.unrecognizedSleepStage;
    data['sleep_score'] = this.sleepScore;
    data['total_interruption_duration'] = this.totalInterruptionDuration;
    data['sleep_charge'] = this.sleepCharge;
    data['sleep_goal'] = this.sleepGoal;
    data['sleep_rating'] = this.sleepRating;
    data['short_interruption_duration'] = this.shortInterruptionDuration;
    data['long_interruption_duration'] = this.longInterruptionDuration;
    data['sleep_cycles'] = this.sleepCycles;
    data['group_duration_score'] = this.groupDurationScore;
    data['group_solidity_score'] = this.groupSolidityScore;
    data['group_regeneration_score'] = this.groupRegenerationScore;
    data['hypnogram'] = this.hypnogram;
    data['heart_rate_samples'] = this.heartRateSamples;

    return data;
  }

  String getpolarUser() {
    return polarUser;
  }
}
