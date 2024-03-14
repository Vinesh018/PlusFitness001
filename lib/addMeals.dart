import 'package:flutter/material.dart';
import 'package:plus_fitness/Vinesh/T_addMeals.dart';
import 'package:plus_fitness/Vinesh/footer.dart';

class addMeals extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => addMealsState();
}

class addMealsState extends State<addMeals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: footer(),

      backgroundColor: Color.fromARGB(255, 231, 235, 237),
      // ignore: prefer_const_constructors
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: [addMealsPage()],
          ),
        ),
      ),
    );
  }
}
