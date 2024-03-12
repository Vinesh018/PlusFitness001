import 'package:flutter/material.dart';
import 'package:plus_fitnss/Vinesh/footer.dart';

class exercisePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => exercisePageState();
}

class exercisePageState extends State<exercisePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: footer(),

      backgroundColor: Color.fromARGB(255, 231, 235, 237),
      // ignore: prefer_const_constructors
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
