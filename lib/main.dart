import 'package:flutter/material.dart';
import 'package:plus_fitnss/Bhautik/datepickercustom.dart';
void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Tutorial',
      home: TutorialHome(),
    ),
  );
}

class TutorialHome extends StatefulWidget {
  const TutorialHome({super.key});

  @override
  State<TutorialHome> createState() => _TutorialHomeState();
}

class _TutorialHomeState extends State<TutorialHome> {
  AppBar appbar = AppBar(
    title: const Text('My Dairy'),
    actions: const [
      Row(
        children: [
         
          DatepickerCustom(),
         
        ],
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for
    // the major Material Components.
    return Scaffold(
      appBar: appbar,
      // ignore: prefer_const_constructors
      body: Column(
        children: const [
          // mealsToday(),
        ],
      ),
    );
  }
}
