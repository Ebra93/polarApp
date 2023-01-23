class UserInformation {
  late int polarUserId;
  late String memberId;
  late String registrationDate;
  late String firstName;
  late String lastName;
  late String birthdate;
  late String gender;
  late double weight;
  late double height;
  late List<dynamic> extraInfo;

  UserInformation(
      {required this.polarUserId,
      required this.memberId,
      required this.registrationDate,
      required this.firstName,
      required this.lastName,
      required this.birthdate,
      required this.gender,
      required this.weight,
      required this.height,
      required this.extraInfo});

  UserInformation.fromJson(Map<String, dynamic> json) {
    polarUserId = json['polar-user-id'];
    memberId = json['member-id'];
    registrationDate = json['registration-date'];
    firstName = json['first-name'];
    lastName = json['last-name'];
    birthdate = json['birthdate'];
    gender = json['gender'];
    weight = json['weight'];
    height = json['height'];
    extraInfo = json['extra-info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['polar-user-id'] = polarUserId;
    data['member-id'] = memberId;
    data['registration-date'] = registrationDate;
    data['first-name'] = firstName;
    data['last-name'] = lastName;
    data['birthdate'] = birthdate;
    data['gender'] = gender;
    data['weight'] = weight;
    data['height'] = height;
    data['extra-info'] = extraInfo.map((v) => v.toJson()).toList();
    return data;
  }
}
