import 'package:flutter/material.dart';
import 'package:testflutter/constant/strings.dart';
import 'package:testflutter/data/models/userInformation.dart';

class UserInformationItem extends StatelessWidget {
  const UserInformationItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: const LinearGradient(colors: <Color>[mycolor2, mycolor3]),
        ),
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        margin: EdgeInsets.fromLTRB(100, 5, 20, 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'polar User Id',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'llll',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ));
  }
}
