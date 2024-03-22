import 'dart:ffi';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:plus_fitness/Bhautik/Myprofilesubpages/StoreUserdata.dart';
import 'package:plus_fitness/Bhautik/b_sign_up.dart';
import 'package:plus_fitness/Bhautik/b_userprofile.dart';
import 'package:plus_fitness/Vinesh/T_Meals.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plus_fitness/main.dart';

double screenWidth = 0;
double screenHeight = 0;


class PersonalDataMainShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.off(UserProfileMainRun());
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          "My Profile",
          style: TextStyle(
              fontFamily: "FontMain",
              fontSize: 22,
              color: Colors.indigo.shade700),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GradientContainerandimage(),
            ),
            StoreusingSharedPreferences(),
          ],
        ),
      ),
    );
  }
}



class GradientContainerandimage extends StatefulWidget {
  @override
  State<GradientContainerandimage> createState() =>
      _GradientContainerandimageState();
}

class _GradientContainerandimageState extends State<GradientContainerandimage> {


  PickedFile? _imageFile;

  final ImagePicker picker = ImagePicker();
  
  @override
  Widget build(BuildContext context) {


    void takephoto() async {
      final pickedfile = await picker.pickImage(source: ImageSource.camera);

      setState(() {
        _imageFile = pickedfile as PickedFile?;
      });
    }

    void takephotofrmgallery() async {
      final pickedfile = await picker.pickImage(source: ImageSource.gallery);

      setState(() {
        _imageFile = pickedfile as PickedFile?;
      });
    }

    Widget bottomSheet() {
      return Container(
          height: 130,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            children: [
              Text("Choose Profile Photo",
                  style: TextStyle(
                      fontFamily: "FontMain",
                      fontSize: 18,
                      color: Colors.blueAccent)),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            takephoto();
                          },
                          icon: Icon(
                            Icons.camera,
                            size: 40,
                            color: Colors.deepPurple,
                          ),
                        ),
                        Text("Camera")
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              takephotofrmgallery();
                            },
                            icon: Icon(
                              Icons.image,
                              size: 40,
                              color: Colors.indigo,
                            )),
                        Text("Gallery")
                      ],
                    )
                  ],
                ),
              )
            ],
          ));
    }

    Widget Imageprofile() {
      return Stack(
        children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage("assets/images/boy.png"),
          ),
          Positioned(
              bottom: 20,
              right: 20,
              child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: ((builder) => bottomSheet()));
                  },
                  child: Icon(Icons.edit)))
        ],
      );
    }

    screenWidth = MediaQuery.of(context).size.width;
    double y = MediaQuery.of(context).size.height;
    screenHeight = y;
    print(screenHeight);
    print(screenWidth);
    return Imageprofile();
  }
}
