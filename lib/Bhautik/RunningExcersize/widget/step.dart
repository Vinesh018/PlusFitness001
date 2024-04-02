import 'package:flutter/material.dart';

class Steps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return Padding(
       padding: const EdgeInsets.only(top: 25),
       child: Column(
        children: [
          Text('1234',style: TextStyle(fontFamily: 'FontMain',fontSize: 33,fontWeight: FontWeight.w800),),
          Text('Total Steps',style: TextStyle(fontFamily: 'FontMain',fontSize: 13,fontWeight: FontWeight.w500,
          height: 2),),
        ],
       ),
     );
  }
}