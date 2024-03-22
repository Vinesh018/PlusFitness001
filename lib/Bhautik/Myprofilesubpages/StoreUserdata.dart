import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plus_fitness/Bhautik/b_userprofile.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? weighdat;
String? heightdata;
String? namedata;
String? agedata;


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
    var getweight = prefs.getString('finalweightvaluestoredinsharedpref');
    var getheight = prefs.getString('finalHeightvaluestoredinsharedpref');
    var getname = prefs.getString('finalnamevaluestoredinsharedpref');
    var getage = prefs.getString('finalagevaluestoredinsharedpref');
    weighdat = getweight != Null ? getweight : '0';
    heightdata = getheight != Null ? getheight : '0';
    namedata = getname != Null ? getname : 'myname';
    agedata = getage != Null ? getage: '22';
    print('Getting Weight fromdatabase is $weighdat');
    print('Getting height fromdatabase is $heightdata');
    print('Getting name fromdatabase is $namedata');
    print('Getting name fromdatabase is $agedata ');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController weightcontroller = TextEditingController();
    TextEditingController namecontroller = TextEditingController();
    TextEditingController heightcontroller = TextEditingController();
    TextEditingController agecontroller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Enter your name'),
          TextFormField(
            focusNode: namefocus,
            keyboardType: TextInputType.name,
            controller: namecontroller,
            decoration: InputDecoration(
              hintText: namedata,
            ),
          ),
            Text('Enter your age'),
          TextFormField(
            focusNode: agefocus,
            keyboardType: TextInputType.number,
            controller: agecontroller,
            decoration: InputDecoration(
              hintText: agedata,
            ),
          ),
          Text('Enter weight in kgs'),
          TextFormField(
            focusNode: weightfocus,
            keyboardType: TextInputType.number,
            controller: weightcontroller,
            decoration: InputDecoration(
              hintText: weighdat,
            ),
          ),
          Text('Enter height  in cm'),
          TextFormField(
            focusNode: heightfocus,
            keyboardType: TextInputType.number,
            controller: heightcontroller,
            decoration: InputDecoration(
              hintText: heightdata,
            ),
          ),
          Center(
            child: FloatingActionButton(
              onPressed: () async {
                var weighttextfieldvalue = weightcontroller.text.toString();
                var heighttextfieldvalue = heightcontroller.text.toString();
                var nametextfieldvalue = namecontroller.text.toString();
                var agetextfieldvalue = agecontroller.text.toString();


                if (weighttextfieldvalue.isEmpty ||
                    weighttextfieldvalue == null) {
                  weighttextfieldvalue = weighdat!;
                  print('now weighttextfieldvaluee is is old weighdata');
                }

                
                if (agetextfieldvalue.isEmpty ||
                    agetextfieldvalue == null) {
                  agetextfieldvalue = agedata!;
                  print('now weighttextfieldvaluee is is old weighdata');
                }

                if (nametextfieldvalue.isEmpty || nametextfieldvalue == null) {
                  nametextfieldvalue = namedata!;
                  print('if name is null then its take old ');
                }
                if (heighttextfieldvalue.isEmpty ||
                    heighttextfieldvalue == null) {
                  heighttextfieldvalue = heightdata!;
                  print('if height is null then takes old height');
                }
                weighdat = weighttextfieldvalue;
                heightdata = heighttextfieldvalue;
                namedata = nametextfieldvalue;
                agedata = agetextfieldvalue;
                var pef = await SharedPreferences.getInstance();
                pef.setString('finalweightvaluestoredinsharedpref', weighdat!);
                pef.setString(
                    'finalHeightvaluestoredinsharedpref', heightdata!);
                pef.setString('finalnamevaluestoredinsharedpref', namedata!);
                pef.setString('finalagevaluestoredinsharedpref', agedata!);
                print('Setting new value to databse weight  is $weighdat');
                print(
                    'Setting new value of Height in database is  $heightdata');
                print('Setting new value of name  in database is  $namedata');
                print('Setting new value of age  in database is  $agedata');
                setState(() {});
                Get.off(UserProfileMainRun());
              },
              child: Text('Save'),
            ),
          ),
        ],
      ),
    );
  }
}
