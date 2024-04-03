import 'package:flutter/material.dart';

class achievementmain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 200,
          width: MediaQuery.of(context).size.width ,
          child: Image.asset('assets/images/under_construction.jpg'),
        ),
      ),
    );
  }
  
}