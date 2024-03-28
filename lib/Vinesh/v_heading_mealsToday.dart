import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:plus_fitness/Vinesh/T_Meals.dart';

class heading_mealsToday extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => heading_mealsTodayState();
}

class heading_mealsTodayState extends State<heading_mealsToday> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Meals Today",
            style: TextStyle(fontFamily: "FontMain", fontSize: 18),
          ),
          InkWell(
              onTap: () {
                Get.off(DragandDrop());
              },
              child: Row(
                children: [
                  const Text(
                    'Customize ',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                        fontFamily: 'FontMain'),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    size: 20,
                  )
                ],
              )),
        ],
      ),
    );
  }
}
