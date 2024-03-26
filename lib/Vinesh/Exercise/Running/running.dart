import 'package:flutter/material.dart';
import 'package:plus_fitness/Vinesh/Exercise/Running/RunningBody.dart';

class Running extends StatefulWidget {
  const Running({super.key});

  @override
  State<Running> createState() => _RunningState();
}

class _RunningState extends State<Running> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 18)),
        ),
        body: MyApp());
  }
}
