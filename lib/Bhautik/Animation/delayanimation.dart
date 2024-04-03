import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';

class MyHomePageb extends StatelessWidget {
  MyHomePageb();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DelayedWidget Example'),
      ),
      body: Center(
          child: DelayedWidget(
              delayDuration: Duration(milliseconds: 200), // Not required
              animationDuration: Duration(seconds: 1), // Not required
              animation: DelayedAnimations.SLIDE_FROM_BOTTOM, // Not required
              child: Container(
                width: 200,
                height: 200,
                color: Colors.red,
              ))),
    );
  }
}