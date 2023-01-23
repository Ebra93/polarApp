class Activity {
  late int id;
  late String polarUser;
  late int transactionId;
  late String date;
  late String created;
  late int calories;
  late int activeCalories;
  late String duration;
  late int activeSteps;

  Activity(
      {required this.id,
      required this.polarUser,
      required this.transactionId,
      required this.date,
      required this.created,
      required this.calories,
      required this.activeCalories,
      required this.duration,
      required this.activeSteps});

  Activity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    polarUser = json['polar-user'];
    transactionId = json['transaction-id'];
    date = json['date'];
    created = json['created'];
    calories = json['calories'];
    activeCalories = json['active-calories'];
    duration = json['duration'];
    activeSteps = json['active-steps'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['polar-user'] = this.polarUser;
    data['transaction-id'] = this.transactionId;
    data['date'] = this.date;
    data['created'] = this.created;
    data['calories'] = this.calories;
    data['active-calories'] = this.activeCalories;
    data['duration'] = this.duration;
    data['active-steps'] = this.activeSteps;
    return data;
  }
}
