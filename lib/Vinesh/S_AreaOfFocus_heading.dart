import 'package:flutter/material.dart';

class heading_areaOfFocus extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => heading_areaOfFocusState();
}

class heading_areaOfFocusState extends State<heading_areaOfFocus> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Area of Focus",
            style: TextStyle(fontFamily: "FontMain", fontSize: 18),
          ),
          InkWell(
              onTap: () {},
              child: Row(
                children: [
                  const Text(
                    'more ',
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
