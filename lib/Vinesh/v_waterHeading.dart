import 'package:flutter/material.dart';

class heading_water extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => heading_mealswaterState();
}

class heading_mealswaterState extends State<heading_water> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Water",
            style: TextStyle(fontFamily: "FontMain", fontSize: 18),
          ),
          InkWell(
              onTap: () {},
              child: Row(
                children: [
                  const Text(
                    'Aqua SmartBottle ',
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
