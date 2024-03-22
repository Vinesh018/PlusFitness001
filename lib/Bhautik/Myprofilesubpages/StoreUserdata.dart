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
                
                    if (nametextfieldvalue.isEmpty ||
                        nametextfieldvalue == null) {
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
                    pef.setString(
                        'finalweightvaluestoredinsharedpref', weighdat!);
                    pef.setString(
                        'finalHeightvaluestoredinsharedpref', heightdata!);
                    pef.setString(
                        'finalnamevaluestoredinsharedpref', namedata!);
                    pef.setString('finalagevaluestoredinsharedpref', agedata!);
                    print('Setting new value to databse weight  is $weighdat');
                    print(
                        'Setting new value of Height in database is  $heightdata');
                    print(
                        'Setting new value of name  in database is  $namedata');
                    print('Setting new value of age  in database is  $agedata');
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
