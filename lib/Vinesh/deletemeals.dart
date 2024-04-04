import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:plus_fitness/Bhautik/b_UperContainer.dart';
import 'package:plus_fitness/Bhautik/constansts/sharedprefkeys.dart';
import 'package:plus_fitness/Vinesh/T_Meals.dart';

import 'package:shared_preferences/shared_preferences.dart';

 List<String> decodedListbreakfast = [];
 List<String> decodelistlunch = [];
 List<String> decodelistdinner = [];

class deletemeals extends StatefulWidget {
  const deletemeals({super.key});

  @override
  State<deletemeals> createState() => deletemealsState();
}

class deletemealsState extends State<deletemeals> {
  @override
  void initState() {
    storeAndRetrieveList();
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
    decodelistlunch = listStringlunch ?? [];
    decodelistdinner = listStringdinner ?? [];

   

    setState(() {
     
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Get.off(DragandDrop());
                },
                icon: Icon(Icons.arrow_back_ios_new_outlined)),
            bottom: const TabBar(
              tabs: [
                Tab(
                    icon: Image(
                        image: AssetImage("assets/images/breakfast.png"))),
                Tab(icon: Image(image: AssetImage("assets/images/lunch.png"))),
                Tab(icon: Image(image: AssetImage("assets/images/dinner.png"))),
              ],
            ),
            title: const Text('Edit your buckets'),
          ),
          body: TabBarView(
            children: [
              showsBreakfastMeals(),
              showslunchMeals(),
              showsDinnerMeals()
            ],
          ),
        ),
      ),
    );
  }

  Widget showsBreakfastMeals() {
    return ListView.builder(
      // itemCount: decodedListbreakfast.length,
      itemCount: decodedListbreakfast.length,
      key: UniqueKey(),
      itemBuilder: (context, index) {
        final item = decodedListbreakfast[index];
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [
                      0.2,
                      0.5,
                      0.8,
                      0.7
                    ],
                    colors: [
                      Colors.indigo.shade50,
                      Colors.indigo.shade200,
                      Colors.indigo.shade300,
                      Colors.indigo.shade400,
                    ]),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(50),
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8))),
            child: Dismissible(
              key: Key(item),
              onDismissed: (direction) async {
                var sp = await SharedPreferences.getInstance();
                decodedListbreakfast.removeAt(index);
                decodedListbreakfast.removeWhere((item) => item == index);
                sp.setStringList(
                    sharedprefkeysfinal.breakfastlist, decodedListbreakfast);
                setState(() {});
              },
            
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "${decodedListbreakfast[index].replaceAll(",", "  ").replaceAll('"', "")} Kcal",
                    style: TextStyle(
                        fontFamily: "FontMain",
                        color: Colors.grey.shade200,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
   Widget showslunchMeals() {
    return ListView.builder(
       key: UniqueKey(),
      itemCount: decodelistlunch.length,
      itemBuilder: (context, index) {
        final item = decodelistlunch[index];
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [
                      0.2,
                      0.5,
                      0.8,
                      0.7
                    ],
                    colors: [
                      Colors.indigo.shade50,
                      Colors.indigo.shade200,
                      Colors.indigo.shade300,
                      Colors.indigo.shade400,
                    ]),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(50),
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8))),
            child: Dismissible(
              key: Key(item),
              onDismissed: (direction) async {
                var sp = await SharedPreferences.getInstance();
                decodelistlunch.removeAt(index);
                decodelistlunch.removeWhere((item) => item == index);
                sp.setStringList(
                    sharedprefkeysfinal.lunchlist, decodelistlunch);
                setState(() {});
              },
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "${decodelistlunch[index].replaceAll(",", "  ").replaceAll('"', "")} Kcal",
                    style: TextStyle(
                        fontFamily: "FontMain",
                        color: Colors.grey.shade200,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
     Widget showsDinnerMeals() {
    return ListView.builder(
       key: UniqueKey(),
      itemCount: decodelistdinner.length,
      itemBuilder: (context, index) {
        final item = decodelistdinner[index];
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [
                      0.2,
                      0.5,
                      0.8,
                      0.7
                    ],
                    colors: [
                      Colors.indigo.shade50,
                      Colors.indigo.shade200,
                      Colors.indigo.shade300,
                      Colors.indigo.shade400,
                    ]),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(50),
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8))),
            child: Dismissible(
              key: Key(item),
              onDismissed: (direction) async {
                var sp = await SharedPreferences.getInstance();
                decodelistdinner.removeAt(index);
                decodelistdinner.removeWhere((item) => item == index);
                sp.setStringList(
                    sharedprefkeysfinal.dinnerlist, decodelistdinner);
                setState(() {});
              },
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "${decodelistdinner[index].replaceAll(",", "  ").replaceAll('"', "")} Kcal",
                    style: TextStyle(
                        fontFamily: "FontMain",
                        color: Colors.grey.shade200,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
