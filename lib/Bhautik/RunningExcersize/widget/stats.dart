import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
var screenwidth;

class Stats extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Workout Status',
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 17,
                    fontFamily: 'FontMain'),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Icon(
              Icons.pie_chart_rounded,
              size: 15,
              color: Colors.blue,
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InfoState(icon: Icons.timer, iconcolor:  Colors.green.shade300, iconbackground: Colors.blue, time: '+5s', value: '30:45', label: 'Time',),
            InfoState(icon: Icons.favorite, iconcolor:  Colors.green.shade300, iconbackground: Colors.yellow, time: '+5s', value: '85 bpm', label: 'Heart rate',),
            InfoState(icon: Icons.star_rate, iconcolor:  Colors.green.shade300, iconbackground: Colors.purple, time: '+5s', value: '169 kcal', label: 'Energy',),
          ],
        )
      ],
    );
  }
}

class InfoState extends StatefulWidget {
    final IconData icon;
  final Color iconcolor;
  final Color iconbackground;
  final String time;
  final String value;
  final String label;

 InfoState({super.key, required this.icon, required this.iconcolor, required this.iconbackground, required this.time, required this.value, required this.label});
  @override
  State<InfoState> createState() => _InfoStateState();
}

class _InfoStateState extends State<InfoState> {

  @override
  Widget build(BuildContext context) {
    screenwidth = MediaQuery.of(context).size.width;
    return  DelayedWidget(
       delayDuration: Duration(milliseconds: 200), // Not required
              animationDuration: Duration(seconds: 1), // Not required
              animation: DelayedAnimations.SLIDE_FROM_BOTTOM, 
      child: Container(
        height: 110,
        width: screenwidth/4,
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(
            color: Colors.black,
            blurRadius: 3,
            offset: Offset(3, 3)
          )],
        ),
      child: Stack(
        children: [
          iconstate(widget: widget, icon: Icons.timer, backgroundcoloricon : widget.iconbackground,),
          labeltext(widget: widget),
          Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.label,style: TextStyle(fontSize: screenwidth/24,),),
                Text(widget.value,style: TextStyle(fontSize: screenwidth/26,fontWeight: FontWeight.w800),)
              ],
            ),
          ),
          
        ],
      ),
      ),
    );
  }
}

class labeltext extends StatelessWidget {
  const labeltext({
    super.key,
    required this.widget,
  });

  final InfoState widget;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4,vertical: 1),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(500)
        ),
        child: Text(widget.time,style: TextStyle(fontSize: screenwidth/33,color: Colors.white),)));
  }
}

class iconstate extends StatelessWidget {
  const iconstate({
    super.key,
    required this.widget, required this.icon, required this.backgroundcoloricon,
  });

  final InfoState widget;
  final IconData icon;
  final Color backgroundcoloricon;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(9)
      ),
      child: Icon(widget.icon,size: screenwidth/30, color: backgroundcoloricon,));
  }
}
