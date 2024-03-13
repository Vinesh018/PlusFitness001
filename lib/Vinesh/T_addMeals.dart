import 'package:flutter/material.dart';
import 'package:plus_fitnss/Vinesh/T_all-meals.dart';

class addMealsPage extends StatefulWidget {
  const addMealsPage({super.key});

  @override
  State<addMealsPage> createState() => _addMealsPageState();
}

class _addMealsPageState extends State<addMealsPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Column(
            children: [
              Container(
                height: 420,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(5),
                      bottomLeft: Radius.circular(45),
                      bottomRight: Radius.circular(45)),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      allMealsadd(),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                    height: 200,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45),
                          topRight: Radius.circular(45),
                          bottomLeft: Radius.circular(45),
                          bottomRight: Radius.circular(5)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Breakfastcont(),
                        lunchcont(),
                        dinnercont(),
                      ],
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Breakfastcont extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BreakfastcontState();
}

class BreakfastcontState extends State<Breakfastcont> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 140,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.deepOrange.shade200,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
    );
  }
}

// Lunch Container

class lunchcont extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => lunchcontState();
}

class lunchcontState extends State<lunchcont> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 140,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.indigo.shade200,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
    );
  }
}

//dinner container

class dinnercont extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => dinnercontState();
}

class dinnercontState extends State<dinnercont> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 140,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.deepPurple.shade200,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
    );
  }
}
