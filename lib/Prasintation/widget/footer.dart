import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:testflutter/constant/strings.dart';

Widget getFooter(int index, int pageIndex, BuildContext context) {
  List items = [
    LineIcons.walking,
    LineIcons.running,
    LineIcons.bed,
    LineIcons.user
  ];
  return Container(
    height: 90,
    width: double.infinity,
    decoration: BoxDecoration(
      color: white,
      border: Border(top: BorderSide(width: 1, color: black.withOpacity(0.06))),
    ),
    child: Padding(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(items.length, (index) {
          return InkWell(
            onTap: () {
              if (index != pageIndex) {
                // Navigator.popAndPushNamed(context, '/sleep');
                Navigator.pop(context);
                Navigator.pushNamed(context, index.toString());
              }
            },
            child: Column(
              children: [
                Icon(
                  items[index],
                  size: 28,
                  color: pageIndex == index ? thirdColor : black,
                ),
                SizedBox(
                  height: 5,
                ),
                pageIndex == index
                    ? Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                            color: thirdColor, shape: BoxShape.circle),
                      )
                    : Container()
              ],
            ),
          );
        }),
      ),
    ),
  );
}
