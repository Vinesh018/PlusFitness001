
// import 'package:flutter/material.dart';
// import 'package:sensors/sensors.dart';


// class FitnessTrackingApp extends StatefulWidget {
//   @override
//   _FitnessTrackingAppState createState() => _FitnessTrackingAppState();
// }

// class _FitnessTrackingAppState extends State<FitnessTrackingApp> {
//   double _accelerometerX = 0.0;
//   double _accelerometerY = 0.0;
//   double _accelerometerZ = 0.0;

//   @override
//   void initState() {
//     super.initState();
//     accelerometerEvents.listen((AccelerometerEvent event) {
//       setState(() {
//         _accelerometerX = event.x;
//         _accelerometerY = event.y;
//         _accelerometerZ = event.z;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Fitness Tracker'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Accelerometer Data'),
//               Text('X: $_accelerometerX'),
//               Text('Y: $_accelerometerY'),
//               Text('Z: $_accelerometerZ'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
