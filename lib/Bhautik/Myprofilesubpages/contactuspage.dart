import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plus_fitness/Bhautik/b_userprofile.dart';

class ContactusPageMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 231, 235, 237),
        leading: IconButton(onPressed: () {
          Get.off(UserProfileMainRun());
        }, icon: Icon(Icons.arrow_back_ios)),
          surfaceTintColor: Colors.transparent,),
      body: Center(
        child: Column(
          children: [conatactusheading()],
        ),
      ),
    );
  }

  Widget conatactusheading() {
    TextStyle headintextstyle =
        TextStyle(color: Colors.black, fontSize: 25, fontFamily: 'ontMain');
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Have questions',
            style: headintextstyle,
          ),
          Text(
            'Shoot us an email',
            style: headintextstyle,
          ),
        ],
      ),
    );
  }
}
