import 'package:flutter/material.dart';
class Meals extends StatefulWidget {

  @override
  State<Meals> createState() => _MealsState();
}

class _MealsState extends State<Meals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
List<MealsItems> _mealsIteam = [
  MealsItems(itemname: 'Avacado', calaries: 240, uid: '1', imageurl: imageurl)
];

class MealsItems  {

  final String itemname;
  final double calaries;
  final String uid;
  final String imageurl;
  MealsItems({required this.itemname, required this.calaries, required this.uid, required this.imageurl});

}
