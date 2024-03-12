import 'package:flutter/material.dart';
import 'package:plus_fitnss/Vinesh/exercise.dart';
import 'package:plus_fitnss/main.dart';

class footer extends StatefulWidget {
  const footer({super.key});

  @override
  State<footer> createState() => _footerState();
}

class _footerState extends State<footer> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: 80,
      child: Stack(
        children: [
          Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: size.width,
                height: 80,
                child: Stack(
                  children: [
                    CustomPaint(
                      size: Size(size.width, 80),
                      painter: customPainter(),
                    ),
                    Center(
                        heightFactor: 0.6,
                        child: FloatingActionButton(
                          shape: const CircleBorder(),
                          onPressed: () {},
                          backgroundColor: Colors.indigoAccent,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        )),
                    Container(
                        width: size.width,
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TutorialHome()),
                                  );
                                },
                                icon: Image(
                                  image: AssetImage("assets/images/tab_1.png"),
                                  height: 50,
                                  width: 50,
                                )),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => exercisePage()),
                                  );
                                },
                                icon: Image(
                                  image: AssetImage("assets/images/tab_2.png"),
                                  height: 50,
                                  width: 50,
                                )),
                            Container(
                              width: size.width * 0.20,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Image(
                                  image: AssetImage("assets/images/tab_3.png"),
                                  height: 50,
                                  width: 50,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: Image(
                                  image: AssetImage("assets/images/tab_4.png"),
                                  height: 50,
                                  width: 50,
                                )),
                          ],
                        )),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class customPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20);

    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(10.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    canvas.drawShadow(path, Colors.black, 25, true);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}