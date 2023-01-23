import 'package:testflutter/data/web-server/userInformation_web_servises.dart';

import '../models/userInformation.dart';

class UserInformationRepository {
  final UserInformationWebservices userInformationWebservices;

  UserInformationRepository(this.userInformationWebservices);

  Future<UserInformation> getAllUserInformation() async {
    //final act = await ActivityListWebServices().getAllUserActivity();

    final userInformation =
        await userInformationWebservices.getAllUserInformation();

    return UserInformation.fromJson(userInformation);
  }
}
