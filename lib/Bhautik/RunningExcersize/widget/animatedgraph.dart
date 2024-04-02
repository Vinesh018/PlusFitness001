import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class graphdata extends StatefulWidget {
  @override
  State<graphdata> createState() => _graphdataState();
}

class _graphdataState extends State<graphdata> {
  List<Flspot> data = [];
  @override
  void initState() {
    data = [
      Flspot(x: 2, y: 7),
      Flspot(x: 4, y: 44),
      Flspot(x: 6, y: 11),
      Flspot(x: 8, y: 89),
      Flspot(x: 10, y: 9),
      Flspot(x: 12, y: 4),
      Flspot(x: 14, y: 45),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final List<Color> color = <Color>[];
    color.add(Colors.indigo[50]!);
    color.add(Colors.indigo[200]!);
    color.add(Colors.indigo);

    final List<double> stops = <double>[];
    stops.add(0.0);
    stops.add(0.5);
    stops.add(1.0);

    final LinearGradient gradientColors =
        LinearGradient(colors: color, stops: stops);

    return Padding(
      padding: const EdgeInsets.only(top: 45,right: 15),
      child: Column(
        children: [
          Text("Your Today's Activity",style: TextStyle(fontFamily: 'FontMain',color: Colors.black,
          fontSize: 18),),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Container(
              height: size.height / 3,
              child: SfCartesianChart(
                  primaryXAxis: NumericAxis(
                    edgeLabelPlacement: EdgeLabelPlacement.shift,
                    interval: 1,
                    majorGridLines: MajorGridLines(width: 0),
                  ),
                  
                  primaryYAxis: NumericAxis(
                    labelFormat: '{value}%',
                    axisLine: AxisLine(width: 0),
                    majorTickLines: MajorTickLines(color: Colors.transparent),
                  ),
                 plotAreaBackgroundColor: Colors.purple.shade50,
                  series: <CartesianSeries>[
                    AreaSeries<Flspot, num>(
            
                        animationDuration: 2500,
                        dataSource: data,
                        xValueMapper: (Flspot spot, _) => spot.x,
                        yValueMapper: (Flspot spot, _) => spot.y,
                        borderWidth: 4,
                        
                        gradient: LinearGradient(
                          colors: color,
                        ),
                        borderGradient: const LinearGradient(
                            colors: <Color>[Colors.blue, Colors.black],
                            stops: <double>[0.2, 0.9]),
                        markerSettings: MarkerSettings(isVisible: false)),
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    data.clear();
    super.dispose();
  }
}

class Flspot {
  final double x;
  final double y;
  Flspot({required this.x, required this.y});
}
