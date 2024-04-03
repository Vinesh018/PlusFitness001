import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:plus_fitness/Bhautik/constansts/sharedprefkeys.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

double x = 0;
double y = 0;
double z = 0;
double miles = 0;
double duration = 0;
double calories = 0;
double addValue = 0.025;
int step = 0;
double previousDistance = 0.0;
double distnace = 0.0;

class AccelerometerExample extends StatefulWidget {
  const AccelerometerExample({super.key});

  @override
  State<AccelerometerExample> createState() => _AccelerometerExampleState();
}

class _AccelerometerExampleState extends State<AccelerometerExample> {
  List<AccelerometerEvent> _accelerometerValues = [];
  late StreamSubscription<AccelerometerEvent> _accelerometerSubscription;

  @override
  void initState() {
    super.initState();
    _accelerometerSubscription = accelerometerEvents.listen((event) {
      setState(() {
        _accelerometerValues = [event];
      });
    });
  }

  @override
  void dispose() {
    _accelerometerSubscription.cancel();
    super.dispose();
  }

  double getValue(double x, double y, double z) {
    double magnitude = sqrt(x * x + y * y + z * z);
    getPreviousvalue();
    double modistance = magnitude - previousDistance;
    setPreviousvalue(magnitude);
    return modistance;
  }

  Future<void> getPreviousvalue() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      previousDistance = sp.getDouble(sharedprefkeysfinal.previousvalue) ?? 0.0;
    });
  }

  Future<void> setPreviousvalue(double distnace) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      sp.setDouble(sharedprefkeysfinal.previousvalue, distnace);
    });
  }

  double calculateMiles(int steps) {
    double milesvalue = (2.2 * steps) / 5280;
    return milesvalue;
  }

  double calculateDuration(int steps) {
    double durationValue = (steps * 1 / 1000);
    return durationValue;
  }

  double calculateCalaries(int steps) {
    double calariesValue = (steps * 0.0566);
    return calariesValue;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AccelerometerEvent>(
        stream: SensorsPlatform.instance.accelerometerEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            x = _accelerometerValues[0].x.toStringAsFixed(2) as double;
            y = _accelerometerValues[0].y.toStringAsFixed(2) as double;
            z = _accelerometerValues[0].z.toStringAsFixed(2) as double;
            distnace = getValue(x, y, z);
            if (distnace > 6) {
              step++;
            }
            calories = calculateCalaries(step);
            duration = calculateDuration(step);
            miles = calculateMiles(step);
             print(calories);
            print(duration);
            print(miles);
          }

          return Center(
            child: Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     Text(
            //       'Accelerometer Data:',
            //       style: TextStyle(fontSize: 20),
            //     ),
            //     SizedBox(height: 10),
            //     if (_accelerometerValues.isNotEmpty)
            //       Column(
            //         children: [
            //           Text(
            //             'X: ${_accelerometerValues[0].x.toStringAsFixed(2)}, '
            //             'Y: ${_accelerometerValues[0].y.toStringAsFixed(2)}, '
            //             'Z: ${_accelerometerValues[0].z.toStringAsFixed(2)}',
            //             style: TextStyle(fontSize: 16),
            //           ),
            //           Text(step.toString()),
            //         ],
            //       )
            //     else
            //       Text('No data available', style: TextStyle(fontSize: 16)),
            //   ],
            ),
          );
        });
  }
}
