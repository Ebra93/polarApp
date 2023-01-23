import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'dart:math';
import 'package:collection/collection.dart';

class PricePoint {
  final double x;
  final double y;

  PricePoint({required this.x, required this.y});
}

class LineChartWidget extends StatefulWidget {
  LineChartWidget({Key? key, required this.points}) : super(key: key);

  //final List<PricePoint> points;
  List<FlSpot> points;

  @override
  State<LineChartWidget> createState() =>
      _LineChartWidgetState(points: this.points);
}

class _LineChartWidgetState extends State<LineChartWidget> {
  //final List<PricePoint> points;
  List<FlSpot> points;
  late int showingTooltipSpot;

  _LineChartWidgetState({required this.points});

  @override
  void initState() {
    showingTooltipSpot = -1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _lineBarsData = [
      LineChartBarData(
          spots: points.map((point) => FlSpot(point.x, point.y)).toList(),
          isCurved: false,
          dotData: FlDotData(
            show: false,
          ),
          color: Color.fromARGB(255, 237, 34, 15)),
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
                      points[touchedSpot.spotIndex].y.toStringAsFixed(2),
                      textStyle,
                    );
                  },
                ).toList();
              },
            ),
            handleBuiltInTouches: true,
            touchCallback: (event, response) {
              if (response?.lineBarSpots != null && event is FlTapUpEvent) {
                setState(() {
                  final spotIndex = response?.lineBarSpots?[0].spotIndex ?? -1;
                  if (spotIndex == showingTooltipSpot) {
                    showingTooltipSpot = spotIndex;
                  } else {
                    showingTooltipSpot = spotIndex;
                  }
                });
              }
            },
          ),
        ),
      ),
    );
  }

  SideTitles get _bottomTitles => SideTitles(
        showTitles: true,
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
}
