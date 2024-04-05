import 'package:flutter/material.dart';
import 'package:plus_fitness/Bhautik/constansts/sharedprefkeys.dart';
import 'package:plus_fitness/Vinesh/v_mealsToday.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<String> decodedListbreakfast = [];
List<String> decodelistlunch = [];
List<String> decodelistdinner = [];
double sumofBrekfastcal = 0;
double sumoflunchcal = 0;
double sumofdinnercal = 0;
List<String> calariesofbreakfast = [];
List<String> calariesoflunch = [];
List<String> calariesofdinner = [];
double? eatencals = 0;
Color textColor = Colors.indigo;
Color carbscolor = Colors.black;
Color protiencolor = Colors.black;
Color fatscolor = Colors.black;

var carbs;
var carbsper;

var fats;
var fatsper;

var protein;
var proteinper;

class name extends StatefulWidget {
  const name({super.key});

  @override
  State<name> createState() => _nameState();
}

class _nameState extends State<name> {
  @override
  void initState() {
    storeAndRetrieveList();
    getsumofcals();
    super.initState();
  }

  Future<void> storeAndRetrieveList() async {
    var sp = await SharedPreferences.getInstance();
    List<String>? listString =
        sp.getStringList(sharedprefkeysfinal.breakfastlist);
    List<String>? listStringlunch =
        sp.getStringList(sharedprefkeysfinal.lunchlist);
    List<String>? listStringdinner =
        sp.getStringList(sharedprefkeysfinal.dinnerlist);
    decodedListbreakfast = listString ?? [];

    // print('The Lenth of Setting decodce is ${decodedListbreakfast.length}');
    decodelistlunch = listStringlunch ?? [];
    // print('The Lenth of Setting decodce lunch is ${decodelistlunch.length}');
    decodelistdinner = listStringdinner ?? [];
    // print('The Lenth of Setting decodce dinner is ${decodelistdinner.length}');
    setState(() {
      calariesofbreakfast = [];
      // print('============================================================================');
      for (var i = 0; i < decodedListbreakfast.length; i++) {
        String str = decodedListbreakfast[i];
        var resultcal;
        resultcal = str.split(',')[1];
        resultcal = resultcal.replaceAll('"', '');
        calariesofbreakfast.add(resultcal);
      }

      List<double> dataListAsDouble =
          calariesofbreakfast.map((data) => double.parse(data)).toList();
      sumofBrekfastcal =
          dataListAsDouble.fold(0, (previous, current) => previous + current);

      // For Lunch Name And Calaries Display -----------------------------------------------------------------------------------------------------

      calariesoflunch = [];
      for (var i = 0; i < decodelistlunch.length; i++) {
        String str = decodelistlunch[i];
        var resultcal;
        resultcal = str.split(',')[1];
        resultcal = resultcal.replaceAll('"', '');
        calariesoflunch.add(resultcal);
        // print("the calaries are :: $calariesoflunch");
        // print(calariesoflunch.runtimeType);
      }

      List<double> dataListAsDoubleoflunch =
          calariesoflunch.map((data) => double.parse(data)).toList();

      print(dataListAsDoubleoflunch);
      sumoflunchcal = dataListAsDoubleoflunch.fold(
          0, (previous, current) => previous + current);

      print(dataListAsDoubleoflunch.runtimeType);
      print(sumofBrekfastcal);

      // For Dinner Name And Calaries Display -----------------------------------------------------------------------------------------------------

      calariesofdinner = [];
      for (var i = 0; i < decodelistdinner.length; i++) {
        String str = decodelistdinner[i];
        var resultcal;
        resultcal = str.split(',')[1];
        resultcal = resultcal.replaceAll('"', '');
        calariesofdinner.add(resultcal);
      }

      List<double> dataListAsDoubleofdinner =
          calariesofdinner.map((data) => double.parse(data)).toList();
      sumofdinnercal = dataListAsDoubleofdinner.fold(
          0, (previous, current) => previous + current);
      Sumofcal = sumofBrekfastcal + sumofdinnercal + sumoflunchcal;
      if (Sumofcal > 2500) {
        textColor = Colors.red;
      }
      if (Sumofcal <= 2500) {
        textColor = Colors.indigo;
      }

      carbs = Sumofcal / 8;

      if (carbs! >= 312.5) {
        carbs = 312.5;
      }
      if (carbs! <= 0) {
        carbs = 0;
      }

      carbsper = carbs / 312.5;
      carbs = 312.5 - carbs;
      if (carbs! <= 0) {
        carbscolor = Colors.green;
      }
      if (carbs > 0) {
        carbscolor = Colors.black;
      }

      protein = Sumofcal / 16;

      if (protein! >= 156.25) {
        protein = 156.25;
      }
      if (protein! <= 0) {
        protein = 0;
      }
      proteinper = protein / 156.25;
      protein = 156.25 - protein;
      if (protein! <= 0) {
        protiencolor = Colors.green;
      }
      if (protein > 0) {
        protiencolor = Colors.black;
      }

      fats = Sumofcal / 36;

      if (fats! >= 69.45) {
        fats = 69.45;
      }
      if (fats! <= 0) {
        fats = 0;
      }
      fatsper = fats / 69.45;
      fats = 69.45 - fats;
      if (fats! <= 0) {
        fatscolor = Colors.green;
      }
      if (fats > 0) {
        fatscolor = Colors.black;
      }

      print("----------------------------");

      print("Carbs value $carbsper");

      print("----------------------------");

      sp.setDouble(sharedprefkeysfinal.sumofallcalaries, Sumofcal);
      print("[][][][][][][][][][][]");
      print(Sumofcal);
      print("[][][][][][][][][][][]");
    });
  }

  Future<void> getsumofcals() async {
    var sp = await SharedPreferences.getInstance();
    eatencals = sp.getDouble(sharedprefkeysfinal.sumofallcalaries);
    if (eatencals! >= 2500) {
      eatencals = 2500;
    }
    if (eatencals! <= 0) {
      eatencals = 0;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
