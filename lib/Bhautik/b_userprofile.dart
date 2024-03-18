import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

double screenWidth = 0;
double screenHeight = 0;

class UserProfileMainRun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 231, 235, 237),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 231, 235, 237),
        title: Center(child: Text("MyProfile")),
      ),
      body: Column(
        children: [
          NameImageRow(),
        ],
      ),
    );
  }
}

class NameImageRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width;
    double y = MediaQuery.of(context).size.height;
    screenWidth = x;
    screenHeight = y;
    return ListTile(
      leading: SizedBox(
        width: 80,
        height: 80,
        child: CircleAvatar(
            radius: 100,
            backgroundColor: Color.fromARGB(255, 231, 235, 237),
            child: Image.asset(
              'assets/images/userprofile.png',
              height: 200,
              width: 200,
            )),
      ),
      title: Text(
        'John Doe',
        style: TextStyle(fontFamily: 'FontMain', fontSize: 19),
      ),
      // subtitle: Text(
      //   'Lose a Fat Progam',
      //   style: TextStyle(
      //       fontFamily: 'FontMain', color: Colors.grey.shade700, fontSize: 14),
      // ),
      trailing: Container(
        width: 100,
        height: 40,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.indigo.shade100, Colors.indigo.shade500]),
            borderRadius: BorderRadius.circular(40)),
        child: ElevatedButton(
          onPressed: null,
          child: Row(
            children: [
              Icon(Icons.edit,size: 15,color: Colors.white,),
              SizedBox(width: 5,),
              Text('Edit',style: TextStyle(fontFamily: 'FontMain',color: Colors.white,fontSize: 16),),
            ],
          ),
          style: ElevatedButton.styleFrom(
              shadowColor: Colors.transparent,
              
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35))),
        ),
      ),
    );
  }
}
  class HeightWeightAge extends StatelessWidget{
    @override
    Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Column(
            children: [
              Row(
                children: [
                  Text('180'),
                  Text('cm')
                ],
              ),
              Text('Height')
            ],
          ),
        )
      ],
    );
  }
  } 
