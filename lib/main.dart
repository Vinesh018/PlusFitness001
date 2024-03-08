import 'package:flutter/material.dart';
import 'package:plus_fitnss/v_mealsToday.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Tutorial',
      home: TutorialHome(),
    ),
  );
}

class TutorialHome extends StatelessWidget {
  const TutorialHome({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for
    // the major Material Components.
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Dairy'),
      ),
      body: Column(
<<<<<<< Updated upstream
        children: [mealsToday()],
=======
        children: [
          mealsToday(),
          ],
>>>>>>> Stashed changes
      ),
    );
  }
}