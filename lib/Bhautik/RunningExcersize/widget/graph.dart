import 'dart:ffi';
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class Graph extends StatefulWidget {
  @override
  State<Graph> createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  // List That Shows The Values
  final List<FlSpot> dummydata2 = [
    FlSpot(1, 50),
    FlSpot(3, 200),
    FlSpot(5, 60),
    FlSpot(7, 20),
    FlSpot(9, 500),
    FlSpot(11, 100),
    FlSpot(13, 0),
    FlSpot(15, 20),
    FlSpot(17, 80),
    FlSpot(19, 200),
    FlSpot(21, 2),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(right: 20, top: 40),
      child: AnimatedPositionedDirectional(
       duration: const Duration(milliseconds: 500),
         curve: Curves.easeInOut,
        child: Container(
          height: size.height / 3,
          child: LineChart(
            // curve: Curves.bounceIn, // Animation type
            // duration: Duration(seconds: 1),
            LineChartData(
              lineTouchData: LineTouchData(
                  // Customize Tooltip data
                  touchTooltipData: LineTouchTooltipData(
                getTooltipItems: (touchedSpots) {
                  return touchedSpots.map((LineBarSpot touchedSpot) {
                    final textStyle = TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25);
                    return LineTooltipItem(touchedSpot.y.toString(), textStyle);
                  }).toList();
                },
              )),
              borderData: FlBorderData(show: false), //Show Border of the graph
              // giving bottom or left side data
              titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                      axisNameWidget: Text('Time'),
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                      )),
                  leftTitles: AxisTitles(
                      axisNameWidget: Text('steps'),
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                      )),
                  rightTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false))),
              gridData: FlGridData(show: false),
              lineBarsData: [
                // The red line
                LineChartBarData(
                  spots: dummydata2, //name of list that data is use to show
                  aboveBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                          colors: [Colors.grey.shade300, Colors.purple.shade100],
                          begin: Alignment.topRight)),
                  belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(colors: [
                        Colors.indigo.shade400,
                        Colors.indigo.shade100
                      ])),
                  isCurved: true,
                  barWidth: 3,
                  dotData: FlDotData(show: false),
                  gradient: LinearGradient(
                      colors: [Colors.indigo.shade300, Colors.indigo.shade400]),
                  preventCurveOverShooting:
                      true, //not allow to go outside of y axis
                  // shadow: Shadow(color: Colors.black,blurRadius: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Model class that accept the value of x and y
class Flspot {
  final double x;
  final double y;
  Flspot({required this.x, required this.y});
}
