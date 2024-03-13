import 'package:flutter/material.dart';

class heading_yourProgram extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => heading_yourProgramState();
}

class heading_yourProgramState extends State<heading_yourProgram> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Your Program",
            style: TextStyle(fontFamily: "FontMain", fontSize: 18),
          ),
          InkWell(
              onTap: () {},
              child: Row(
                children: [
                  const Text(
                    'Details ',
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
