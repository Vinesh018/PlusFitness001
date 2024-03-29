import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class Confetti extends StatefulWidget {
  @override
  _ConfettiState createState() => _ConfettiState();
}

class _ConfettiState extends State<Confetti> {
  late ConfettiController _controllerCenterRight;
  late ConfettiController _controllerCenterLeft;
  @override
  void initState() {
    _controllerCenterRight =
        ConfettiController(duration: const Duration(seconds: 4));
    _controllerCenterLeft =
        ConfettiController(duration: const Duration(seconds: 4));
    _controllerCenterLeft.play();
    _controllerCenterRight.play();
    super.initState();
  }

  @override
  void dispose() {
    _controllerCenterRight.dispose();
    _controllerCenterLeft.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ConfettiWidget(
          blastDirectionality: BlastDirectionality.explosive,
          maxBlastForce: 15,
          confettiController: _controllerCenterRight,
          blastDirection: 170,
          particleDrag: 0.05,
          emissionFrequency: 0.05,
          numberOfParticles: 20,
          gravity: 0.2,
        ),
      ),
    );
  }
}
