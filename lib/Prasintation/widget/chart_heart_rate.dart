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

LineChartData heartratesleeping(Map<String, dynamic> mymap) {
  List<FlSpot> flSpotList = [];

  TimeOfDay startTime;
  mymap.forEach(
      (key, value) => flSpotList.add(FlSpot(timeforChart(key), value + 0.0)));

  return LineChartData(
    lineTouchData: LineTouchData(),
    gridData: FlGridData(
      show: true,
      drawVerticalLine: false,
      drawHorizontalLine: false,
    ),

    titlesData: FlTitlesData(
      show: true,
      leftTitles: AxisTitles(axisNameSize: 20),
      rightTitles: AxisTitles(
          axisNameSize: 20,
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 22,
          )),
      topTitles: AxisTitles(
          axisNameSize: 20,
          axisNameWidget: Text(
            "Heart Rate while sleeping",
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          )),
    ),

    borderData: FlBorderData(
      show: false,
    ),
    // minX: 0,
    //maxX: 11,
    //minY: 0,
    //maxY: 6,
    lineBarsData: [
      LineChartBarData(
        spots: flSpotList,
        isCurved: false,
        color: gradientColors.first,
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          color:
              gradientColors.map((color) => color.withOpacity(0.3)).toList()[1],
        ),
      ),
    ],
  );
}
