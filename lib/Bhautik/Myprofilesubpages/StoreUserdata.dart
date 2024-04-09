import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plus_fitness/Bhautik/Myprofilesubpages/personaldata.dart';
import 'package:plus_fitness/Bhautik/b_userprofile.dart';
import 'package:plus_fitness/Bhautik/constansts/firebaseconst.dart';
import 'package:plus_fitness/Bhautik/constansts/sharedprefkeys.dart';
import 'package:shared_preferences/shared_preferences.dart';

String weighdat = '40';
String heightdata = '100';
String namedata = 'Your Name';
String agedata = '18';
String usermail = '';
DocumentSnapshot? snapshot;

class StoreusingSharedPreferences extends StatefulWidget {
  @override
  State<StoreusingSharedPreferences> createState() =>
      _StoreusingSharedPreferencesState();
}

class _StoreusingSharedPreferencesState
    extends State<StoreusingSharedPreferences> {
  FocusNode weightfocus = FocusNode();
  FocusNode heightfocus = FocusNode();
  FocusNode namefocus = FocusNode();
  FocusNode agefocus = FocusNode();
  void initState() {
    super.initState();
    getweightfordisplay();
  }

  void getweightfordisplay() async {
    var prefs = await SharedPreferences.getInstance();
    var getusermail = prefs.getString(sharedprefkeysfinal.useremail); //Firebase
    usermail = getusermail!;
    getdata();
    setState(() {});
  }

  void getdata() async {
    final data = await FirebaseFirestore.instance
        .collection(firebaseconst.usercollection)
        .doc(usermail)
        .get()
        .then(
      (value) {
        var fields = value.data();
          namedata = fields!['Name'] ?? 'Loading';
          agedata = fields!['Age'] ?? 'Loading';
          weighdat = fields!['Weight'] ?? 'Loading';
          heightdata = fields!['Height'] ?? 'Loading';
      },
    );
     setState(() { });
  }



  storeprofiledata(String name, String age, String weight, String height) {
    FirebaseFirestore.instance
        .collection(firebaseconst.usercollection)
        .doc(usermail)
        .set({'Name': name, 'Age': age, 'Weight': weight, 'Height': height});
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController weightcontroller =
        TextEditingController(text: weighdat);
    TextEditingController namecontroller =
        TextEditingController(text: namedata);
    TextEditingController heightcontroller =
        TextEditingController(text: heightdata);
    TextEditingController agecontroller = TextEditingController(text: agedata);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Name',
              style: TextStyle(
                  fontFamily: "FontMain",
                  color: Colors.indigo.shade600,
                  fontSize: 20)),
          TextFormField(
            focusNode: namefocus,
            keyboardType: TextInputType.name,
            controller: namecontroller,
            decoration: InputDecoration(
              fillColor: Colors.indigo.shade700,
              icon: Icon(Icons.account_circle_outlined),
              hintStyle: TextStyle(fontFamily: "FontMain", fontSize: 16),
              hintText: namedata,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text('Age',
                style: TextStyle(
                    fontFamily: "FontMain",
                    color: Colors.indigo.shade600,
                    fontSize: 20)),
          ),
          TextFormField(
            focusNode: agefocus,
            keyboardType: TextInputType.number,
            controller: agecontroller,
            decoration: InputDecoration(
              fillColor: Colors.indigo.shade700,
              icon: Image.asset(
                "assets/images/anti-age.png",
                height: 22,
                width: 22,
              ),
              hintStyle: TextStyle(fontFamily: "FontMain", fontSize: 16),
              hintText: agedata,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text('Weight in kgs',
                style: TextStyle(
                    fontFamily: "FontMain",
                    color: Colors.indigo.shade600,
                    fontSize: 20)),
          ),
          TextFormField(
            focusNode: weightfocus,
            keyboardType: TextInputType.number,
            controller: weightcontroller,
            decoration: InputDecoration(
              fillColor: Colors.indigo.shade700,
              icon: Image.asset(
                "assets/images/weight.png",
                height: 22,
                width: 22,
              ),
              hintStyle: TextStyle(fontFamily: "FontMain", fontSize: 16),
              hintText: weighdat,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text('Height in cm',
                style: TextStyle(
                    fontFamily: "FontMain",
                    color: Colors.indigo.shade600,
                    fontSize: 20)),
          ),
          TextFormField(
            focusNode: heightfocus,
            keyboardType: TextInputType.number,
            controller: heightcontroller,
            decoration: InputDecoration(
              fillColor: Colors.indigo.shade700,
              icon: Icon(Icons.accessibility_outlined),
              hintStyle: TextStyle(fontFamily: "FontMain", fontSize: 16),
              hintText: heightdata,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width - 100,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.indigo.shade400)),
                  onPressed: () async {
                    var weighttextfieldvalue = weightcontroller.text.toString();
                    var heighttextfieldvalue = heightcontroller.text.toString();
                    var nametextfieldvalue = namecontroller.text.toString();
                    var agetextfieldvalue = agecontroller.text.toString();

                    if (weighttextfieldvalue.isEmpty) {
                      weighttextfieldvalue = weighdat;
                      // print('now weighttextfieldvaluee is is old weighdata');
                    }

                    if (agetextfieldvalue.isEmpty) {
                      agetextfieldvalue = agedata;
                      // print('now weighttextfieldvaluee is is old weighdata');
                    }

                    if (nametextfieldvalue.isEmpty) {
                      nametextfieldvalue = namedata;
                      // print('if name is null then its take old ');
                    }
                    if (heighttextfieldvalue.isEmpty) {
                      heighttextfieldvalue = heightdata;
                      // print('if height is null then takes old height');
                    }
                    storeprofiledata(nametextfieldvalue, agetextfieldvalue,
                        weighttextfieldvalue, heighttextfieldvalue);
                    setState(() {});
                    Get.off(UserProfileMainRun());
                  },
                  child: Text('Save',
                      style: TextStyle(
                          fontFamily: "FontMain",
                          fontSize: 20,
                          color: Colors.white)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
