import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:plus_fitness/Bhautik/RunningExcersize/widget/animatedgraph.dart';
import 'package:plus_fitness/Bhautik/RunningExcersize/widget/dates.dart';
import 'package:plus_fitness/Bhautik/RunningExcersize/widget/info.dart';
import 'package:plus_fitness/Bhautik/RunningExcersize/widget/stats.dart';
import 'package:plus_fitness/Bhautik/constansts/imagepath.dart';
import 'package:plus_fitness/Bhautik/constansts/sharedprefkeys.dart';
import 'package:plus_fitness/exercise.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

int steps = 0;
var xcoordinate;
var ycoordinate;
var zcoordinate;
double miles = 0;
double duration = 0;
double calories = 0;
double addValue = 0.025;
double distnaces = 0.0;
double previousDistance = 0.0;

class Runningpage extends StatefulWidget {
  const Runningpage({super.key, this.title});

  final String? title;

  @override
  State<Runningpage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Runningpage> {
  static const Duration _ignoreDuration = Duration(milliseconds: 20);
  AccelerometerEvent? _accelerometerEvent;
  DateTime? _accelerometerUpdateTime;
  int? _accelerometerLastInterval;

  final _streamSubscriptions = <StreamSubscription<dynamic>>[];

  Duration sensorInterval = SensorInterval.normalInterval;

  Future<void> storestepsinsp(int steps, String keys) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt(keys, steps);
  }

  Future<void> getstepsinsp() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    steps = sp.getInt(sharedprefkeysfinal.stepcount) ?? 0;
    print('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
    print(steps);
    print('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
  }

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
      double magnitude = sqrt(x * x + y * y);
      getPreviousvalue();
      double modistance = magnitude - previousDistance;
      setPreviousvalue(magnitude);
      return modistance;
    }

    distnaces = getValue(xcoordinate, ycoordinate, zcoordinate);
    if (distnaces > 6) {
      steps++;
      storestepsinsp(steps, sharedprefkeysfinal.stepcount);
      getstepsinsp();
      setState(() {});
    }

    double calculateMiles(int steps) {
      double milesvalue = ((2.2 * steps) / 5280) * 1.6;
      setState(() {});
      return milesvalue;
    }

    double calculateDuration(int steps) {
      double durationValue = (steps * 1 / 1000) * 10;
      setState(() {});
      return durationValue;
    }

    double calculateCalaries(int steps) {
      double calariesValue = (steps * 0.0566);
      setState(() {});
      return calariesValue;
    }

    calories = calculateCalaries(steps);
    duration = calculateDuration(steps);
    miles = calculateMiles(steps);
    TextStyle appbartextstyle = TextStyle(
        fontFamily: 'FontMain',
        fontSize: 25,
        fontWeight: FontWeight.w500,
        color: Colors.black);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.off(exercisePage());
            },
            icon: Icon(Icons.arrow_back_ios_new)),
        title: Text(
          'Activity',
          style: appbartextstyle,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Dates(),//=-----------------------dates 
            ),
            Padding(
              padding: const EdgeInsets.only(top: 45,left: 20,right: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/foot.png',height: 30,width: 30,color: Colors.indigo,),
                      Padding(
                        padding: const EdgeInsets.only(left: 7),
                        child: Text(
                          steps.toString(),
                          style: TextStyle(
                              fontFamily: 'FontMain',
                              fontSize: 33,
                              color: Colors.indigo,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Total Steps',
                    style: TextStyle(
                        fontFamily: 'FontMain',
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        height: 2),
                  ),
                ],
              ),
            ),
            // For Showing graph
            graphdata(),//-=-=-=-=-=-=-=-==---=-=-=-=-=--=-=-=-=--Graph calling
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                 
          CalaryDrationDistance(calvalue: calories, unit: 'kcal', name: 'Calaries', imagepath: '${imagepath.imgpath}kcal.png', ),
          CalaryDrationDistance(calvalue: miles, unit: 'km', name: 'Distance', imagepath: '${imagepath.imgpath}distance.png',),
          CalaryDrationDistance(calvalue: duration, unit: 'hr', name: 'Hours', imagepath: '${imagepath.imgpath}time.png',),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          'Workout Status',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 17,
                              fontFamily: 'FontMain'),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.pie_chart_rounded,
                        size: 15,
                        color: Colors.blue,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InfoState(
                        icon: Icons.timer,
                        iconcolor: Colors.green.shade300,
                        iconbackground: Colors.blue,
                        time: '+5s',
                        value: '30:45',
                        label: 'Time',
                      ),
                      InfoState(
                        icon: Icons.favorite,
                        iconcolor: Colors.green.shade300,
                        iconbackground: Colors.yellow,
                        time: '+5s',
                        value: '85 bpm',
                        label: 'Heart rate',
                      ),
                      InfoState(
                        icon: Icons.star_rate,
                        iconcolor: Colors.green.shade300,
                        iconbackground: Colors.purple,
                        time: '+5s',
                        value: '169 kcal',
                        label: 'Energy',
                      ),
                    ],
                  )
                ],
              ),
            ),
        
            // Text("The Steps taken is ${steps.toString()}"),
            // Text("The calaries is ${calories.toString()} kcal"),
            // Text("The time taken is ${duration.toString()} min"),
            // Text("The kilometer taken is ${miles.toString()} km"),
          ],
        ),
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
    getstepsinsp();
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
