import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plus_fitness/Bhautik/b_userprofile.dart';
import 'package:plus_fitness/Vinesh/T_Meals.dart';
import 'package:plus_fitness/exercise.dart';
import 'package:plus_fitness/main.dart';

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
      color: const Color.fromARGB(0, 0, 0, 0),
      height: 80,
      child: Stack(
        children: [
          Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                color: Colors.white.withOpacity(0),
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
                        color: Colors.white.withOpacity(0),
                        width: size.width,
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Get.off(TutorialHome());
                                },
                                icon: Image(
                                  image: AssetImage("assets/images/tab_1.png"),
                                  height: 50,
                                  width: 50,
                                )),
                            IconButton(
                                onPressed: () {
                                 Get.off(exercisePage());

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
                                onPressed: () {
                                  Get.off(DragandDrop());
                                      
                                      
                                },
                                icon: Image(
                                  image: AssetImage("assets/images/tab_3.png"),
                                  height: 50,
                                  width: 50,
                                )),
                            IconButton(
                                onPressed: () {
                                  // clears the previous routes and opens a new screen.
                                  Get.off(UserProfileMainRun());
                                },
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
    return false;
  }
}
class FadeRoute extends PageRouteBuilder {
  final Widget page;
  FadeRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
