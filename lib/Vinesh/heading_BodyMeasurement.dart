import 'package:flutter/material.dart';

class heading_BodyMeasurement extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => heading_bodyMeasurementState();
}

class heading_bodyMeasurementState extends State<heading_BodyMeasurement> {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Body Measurement",
            style: TextStyle(fontFamily: "FontMain", fontSize: 18),
          ),
          InkWell(
              onTap: () {},
              child: Row(
                children: [
                  const Text(
                    'Today ',
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
