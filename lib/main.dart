import 'package:flutter/material.dart';
import 'package:plus_fitnss/Vinesh/v_mealsToday.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Flutter Tutorial',
      home: TutorialHome(),
    ),
  );
}

AppBar appbar = AppBar(title: Text('My Dairy'),
leading: Row(
  children: [
    Icon(Icons.arrow_back_ios_new_rounded),
    Icon(Icons.calendar_today_outlined),
    Text('')
  ],
),);

class TutorialHome extends StatelessWidget {
  const TutorialHome({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for
    // the major Material Components.
    return Scaffold(
      appBar: appbar,
      body: Column(
        children: [
          // mealsToday(),
          ],
      ),
    );
  }
}