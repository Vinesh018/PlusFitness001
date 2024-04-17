import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plus_fitness/Bhautik/Myprofilesubpages/StoreUserdata.dart';
import 'package:plus_fitness/Bhautik/b_userprofile.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plus_fitness/Bhautik/constansts/firebaseconst.dart';
import 'package:plus_fitness/Bhautik/constansts/sharedprefkeys.dart';
import 'package:shared_preferences/shared_preferences.dart';

double screenWidth = 0;
double screenHeight = 0;

String imagefromfirebase = "";




class PersonalDataMainShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 231, 235, 237),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 231, 235, 237),
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

Uint8List? image;

class GradientContainerandimage extends StatefulWidget {
  @override
  State<GradientContainerandimage> createState() =>
      _GradientContainerandimageState();
}

class _GradientContainerandimageState extends State<GradientContainerandimage> {
  File? selectedImage;
  final ImagePicker picker = ImagePicker();

  final storageRef = FirebaseStorage.instance.ref();


  @override
  void initState() {
    // TODO: implement initState
    // getImage();
    getimagefromfirebase();
  }

  // static Future<bool> saveImage(List<int> imageBytes) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String base64Image = base64Encode(imageBytes);
  //   return prefs.setString("image", base64Image);
  // }
  String imageurl = "";
  Future<void> addImageToFirebase(image) async {
    print("in addiamge");

    // String base64Image = base64Encode(image!);

    try {
      final ref = storageRef.child("UserprofileImages/$usermail.png");

      await ref
          .putFile(
              selectedImage!,
              SettableMetadata(
                contentType: "image/jpeg",
              ))
          .whenComplete(() => print("image stored to firebase"));

      imageurl = await ref.getDownloadURL();

      FirebaseFirestore.instance
          .collection(firebaseconst.usercollection)
          .doc(usermail)
          .update({'imageUrl': imageurl});
      print(imageurl);
     getimagefromfirebase();

      setState(() {});
    } on FirebaseException catch (e) {
      print(e.message);
      // ...
    }
  

  }

  getimagefromfirebase() async {
      SharedPreferences sp = await SharedPreferences.getInstance();
      String? usermail = sp.getString(sharedprefkeysfinal.useremail);
    await FirebaseFirestore.instance
        .collection(firebaseconst.usercollection)
        .doc(usermail)
        .get()
        .then(
      (value) {
        var fields = value.data();
        imagefromfirebase = fields!['imageUrl'] ?? " ";
        print("[[][][][][][][][][][][][][][][][][][]]");
        print("in getimage");

        print(imagefromfirebase);
        print("[[][][][][][][][][][][][][][][][][][]]");

        setState(() {});
      },
    );

 
  }

  @override
  Widget build(BuildContext context) {
    void takephoto() async {
      final pickedfile = await picker.pickImage(source: ImageSource.camera);
      if (pickedfile == null) return;
      setState(() {
        selectedImage = File(pickedfile.path);
        image = File(pickedfile.path).readAsBytesSync();
        // print("----------------");
        // print(image.runtimeType);
        // print("----------------");
        // saveImage(image!);
        addImageToFirebase(image);
      });
    }

    Future takephotofrmgallery() async {
      final pickedfile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedfile == null) return;
      setState(() {
        selectedImage = File(pickedfile.path);
        image = File(pickedfile.path).readAsBytesSync();
        //  saveImage(image!);

        addImageToFirebase(image);
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
                            Navigator.of(context).pop();
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
                              Navigator.of(context).pop();
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
          imagefromfirebase != ""
              ? CircleAvatar(
                // backgroundImage: AssetImage("assets/images/boy.png"),
                backgroundColor: Color.fromARGB(255, 231, 235, 237),
                  radius: 80, foregroundImage: NetworkImage(imagefromfirebase))
              : CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage("assets/images/boy.png")),
          Positioned(
              bottom: 5,
              right: 10,
              child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: ((builder) => bottomSheet()));
                  },
                  child: Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                        color: Colors.indigo.shade200,
                        border: Border.all(
                            color: Color.fromARGB(255, 231, 235, 237),
                            width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Icon(
                      Icons.add_a_photo_rounded,
                      size: 16,
                      color: Colors.white,
                    ),
                  )))
        ],
      );
    }

    screenWidth = MediaQuery.of(context).size.width;
    double y = MediaQuery.of(context).size.height;
    screenHeight = y;
    // print(screenHeight);
    // print(screenWidth);
    return Imageprofile();
  }
}
