import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:testflutter/constant/strings.dart';

List<Color> gradientColors = [secondary, primary];

double timeforChart(String key) {
  int x = int.parse(key.split(':')[0]);
  if (x < 12) {
    return x + 24 + (int.parse(key.split(':')[1]) / 100);
  } else {
    return x + (int.parse(key.split(':')[1]) / 100);
  }
}

Widget hypnogram(Map<String, dynamic> mymap) {
  List<FlSpot> flSpotList = [];
  List<double> sss = [];
  mymap.forEach((key, value) => sss.add(value + 0.0));
  List<String> zeit = [];
  mymap.forEach((key, value) => zeit.add(key));

  mymap.forEach(
      (key, value) => flSpotList.add(FlSpot(timeforChart(key), value + 0.0)));

  return Container(
    width: double.infinity,
    height: 600,
    decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
              spreadRadius: 20,
              blurRadius: 10,
              color: black.withOpacity(0.01),
              offset: const Offset(0, 1))
        ]),
    child: Padding(
      padding: const EdgeInsets.all(1),
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(mymap.length, (index) {
              return Tooltip(
                message: zeit[index].toString(),
                verticalOffset: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(colors: sleeprate[1]['color']),
                ),
                height: 50,
                padding: const EdgeInsets.all(8.0),
                preferBelow: false,
                textStyle: const TextStyle(
                  fontSize: 24,
                ),
                showDuration: const Duration(seconds: 4),
                waitDuration: const Duration(seconds: 1),
                child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 10,
                                  height: 172,
                                  decoration: BoxDecoration(
                                      color: bgTextField1,
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                                // activity bar
                                Positioned(
                                  bottom: 0,
                                  child: Container(
                                    width: 10,
                                    height: 43 * sss[index],
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors:
                                                sleeprate[sss[index].toInt()]
                                                    ['color']),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    )),
              );
            }),
          )),
    ),
  );
}

Widget sleepart(String message, String text, int color) {
  return Tooltip(
      message: message,
      verticalOffset: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(colors: sleeprate[color]['color']),
      ),
      height: 50,
      padding: const EdgeInsets.all(8.0),
      preferBelow: false,
      textStyle: const TextStyle(
        fontSize: 24,
      ),
      showDuration: const Duration(seconds: 4),
      waitDuration: const Duration(seconds: 1),
      child: Row(
        children: [
          Text(text),
          Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: sleeprate[color]['color']),
                borderRadius: BorderRadius.circular(30)),
          )
        ],
      ));
}

List<FlSpot> flSpotList = [];
List<FlSpot> heartpoints(Map<String, dynamic> mymap) {
  flSpotList = [];
  mymap.forEach(
      (key, value) => flSpotList.add(FlSpot(timeforChart(key), value + 0.0)));

  return flSpotList;
}

Widget sleeppionts(Map<String, dynamic> mymap) {
  List<FlSpot> flSpotList = [];
  int showingTooltipSpot = -1;

  mymap.forEach(
      (key, value) => flSpotList.add(FlSpot(timeforChart(key), value + 0.0)));
  final _lineBarsData = [
    LineChartBarData(
        spots: flSpotList.map((point) => FlSpot(point.x, point.y)).toList(),
        isCurved: false,
        dotData: FlDotData(
          show: false,
        ),
        color: const Color.fromARGB(255, 237, 34, 15)),
  ];
  return AspectRatio(
    aspectRatio: 2,
    child: LineChart(
      LineChartData(
        lineBarsData: _lineBarsData,
        borderData: FlBorderData(
            border: const Border(bottom: BorderSide(), left: BorderSide())),
        gridData: FlGridData(show: true),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(sideTitles: _bottomTitles),
          leftTitles: AxisTitles(sideTitles: _bottomTitles),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        showingTooltipIndicators: showingTooltipSpot != -1
            ? [
                ShowingTooltipIndicators([
                  LineBarSpot(_lineBarsData[0], showingTooltipSpot,
                      _lineBarsData[0].spots[showingTooltipSpot]),
                ])
              ]
            : [],
        lineTouchData: LineTouchData(
          enabled: true,
          touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: Colors.blue,
            tooltipRoundedRadius: 20.0,
            fitInsideHorizontally: true,
            tooltipMargin: 0,
            getTooltipItems: (touchedSpots) {
              return touchedSpots.map(
                (LineBarSpot touchedSpot) {
                  const textStyle = TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 243, 237, 237),
                  );
                  return LineTooltipItem(
                    flSpotList[touchedSpot.spotIndex].y.toStringAsFixed(2),
                    textStyle,
                  );
                },
              ).toList();
            },
          ),
          handleBuiltInTouches: true,
        ),
      ),
    ),
  );
}

SideTitles get _bottomTitles => SideTitles(
      showTitles: true,
      interval: 1,
      getTitlesWidget: (value, meta) {
        String text = '';
        switch (value.toInt()) {
          case 55:
            text = '55';
            break;
          case 60:
            text = '60';
            break;
          case 65:
            text = '65';
            break;
          case 22:
            text = '22';
            break;
          case 23:
            text = '23';
            break;

          case 24:
            text = '00';
            break;
          case 25:
            text = '01';
            break;
          case 26:
            text = '02';
            break;
          case 27:
            text = '03';
            break;
          case 28:
            text = '04';
            break;
          case 29:
            text = '05';
            break;
          case 30:
            text = '06';
            break;
          case 31:
            text = '07';
            break;
          case 32:
            text = '08';
            break;
          case 33:
            text = '09';
            break;
          case 34:
            text = '10';
            break;
          case 35:
            text = '11';
            break;
          case 36:
            text = '12';
            break;
          case 37:
            text = '13';
            break;
          case 38:
            text = '14';
            break;
        }

        return Text(text);
      },
    );
