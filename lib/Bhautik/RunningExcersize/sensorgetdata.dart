import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:plus_fitness/Bhautik/constansts/sharedprefkeys.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

var steps = 0;
var xcoordinate;
var ycoordinate;
var zcoordinate;
double miles = 0;
double duration = 0;
double calories = 0;
double addValue = 0.025;
double distnaces = 0.0;
double previousDistance = 0.0;

class MyAppt extends StatelessWidget {
  const MyAppt({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sensors Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0x9f4376f8),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, this.title});

  final String? title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const Duration _ignoreDuration = Duration(milliseconds: 20);
  AccelerometerEvent? _accelerometerEvent;
  DateTime? _accelerometerUpdateTime;
  int? _accelerometerLastInterval;

  final _streamSubscriptions = <StreamSubscription<dynamic>>[];

  Duration sensorInterval = SensorInterval.normalInterval;

  @override
  Widget build(BuildContext context) {
    xcoordinate = _accelerometerEvent?.x ?? 0.0;
    ycoordinate = _accelerometerEvent?.y ?? 0.0;
    zcoordinate = _accelerometerEvent?.z ?? 0.0;
    Future<void> getPreviousvalue() async {
      SharedPreferences sp = await SharedPreferences.getInstance();
      setState(() {
        previousDistance =
            sp.getDouble(sharedprefkeysfinal.previousvalue) ?? 0.0;
      });
    }

    Future<void> setPreviousvalue(double distnace) async {
      SharedPreferences sp = await SharedPreferences.getInstance();
      setState(() {
        sp.setDouble(sharedprefkeysfinal.previousvalue, distnace);
      });
    }

    double getValue(double x, double y, double z) {
      double magnitude = sqrt(x * x + y * y + z * z);
      getPreviousvalue();
      double modistance = magnitude - previousDistance;
      setPreviousvalue(magnitude);
      return modistance;
    }

    distnaces = getValue(xcoordinate, ycoordinate, zcoordinate);
    if (distnaces > 6) {
      steps++;
      setState(() {});
    }

    double calculateMiles(int steps) {
      double milesvalue = ((2.2 * steps) / 5280)*1.6;
      setState(() {
      });
      return milesvalue;
    }

    double calculateDuration(int steps) {
      double durationValue = (steps * 1 / 1000) * 10;
      setState(() {
        
      });
      return durationValue;
    }

    double calculateCalaries(int steps) {
      double calariesValue = (steps * 0.0566);
      setState(() {
        
      });
      return calariesValue;
    }

    calories = calculateCalaries(steps);
    duration = calculateDuration(steps);
    miles = calculateMiles(steps);
 
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sensors Plus Example'),
        elevation: 4,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.black38),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Table(
              columnWidths: const {
                0: FlexColumnWidth(4),
                4: FlexColumnWidth(2),
              },
              children: [
                const TableRow(
                  children: [
                    SizedBox.shrink(),
                    Text('X'),
                    Text('Y'),
                    Text('Z'),
                    Text('Interval'),
                  ],
                ),
                TableRow(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text('Accelerometer'),
                    ),
                    Text(_accelerometerEvent?.x.toStringAsFixed(1) ?? '?'),
                    Text(_accelerometerEvent?.y.toStringAsFixed(1) ?? '?'),
                    Text(_accelerometerEvent?.z.toStringAsFixed(1) ?? '?'),
                    Text('${_accelerometerLastInterval?.toString() ?? '?'} ms'),
                  ],
                ),
              ],
            ),
          ),
          Text("The Steps taken is ${steps.toString()}"),
          Text("The calaries is ${calories.toString()} kcal"),
          Text("The time taken is ${duration.toString()} min"),
          Text("The kilometer taken is ${miles.toString()} km"),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    for (final subscription in _streamSubscriptions) {
      subscription.cancel();
    }
  }

  @override
  void initState() {
    super.initState();
    _streamSubscriptions.add(
      accelerometerEventStream(samplingPeriod: sensorInterval).listen(
        (AccelerometerEvent event) {
          final now = DateTime.now();
          setState(() {
            _accelerometerEvent = event;
            if (_accelerometerUpdateTime != null) {
              final interval = now.difference(_accelerometerUpdateTime!);
              if (interval > _ignoreDuration) {
                _accelerometerLastInterval = interval.inMilliseconds;
              }
            }
          });
          _accelerometerUpdateTime = now;
        },
        onError: (e) {
          showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                  title: Text("Sensor Not Found"),
                  content: Text(
                      "It seems that your device doesn't support Accelerometer Sensor"),
                );
              });
        },
        cancelOnError: true,
      ),
    );
  }
}
