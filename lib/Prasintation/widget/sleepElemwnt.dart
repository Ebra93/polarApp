import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testflutter/constant/strings.dart';

class SleepElement extends StatefulWidget {
  const SleepElement({
    Key? key,
    required this.title,
    required this.mesgese,
    required this.info,
    required this.mycolor,
  }) : super(key: key);
  final String title;
  final String mesgese;
  final String info;
  final int mycolor;

  @override
  State<SleepElement> createState() => _SleepElementState();
}

class _SleepElementState extends State<SleepElement> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
        child: Tooltip(
          message: widget.mesgese,
          verticalOffset: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: LinearGradient(colors: sleeprate[1]['color']),
          ),
          height: 50,
          padding: EdgeInsets.all(8.0),
          preferBelow: false,
          textStyle: const TextStyle(
            fontSize: 24,
          ),
          showDuration: const Duration(seconds: 5),
          waitDuration: const Duration(seconds: 0),
          child: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: sleeprate[5]['color']),
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(widget.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      Text(widget.info,
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 205, 55, 45))),
                    ],
                  ),
                ],
              )),
        ));
  }
}
