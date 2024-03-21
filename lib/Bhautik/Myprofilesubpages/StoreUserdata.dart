import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? weighdat;
String? heightdata;

class StoreusingSharedPreferences extends StatefulWidget {
  @override
  State<StoreusingSharedPreferences> createState() =>
      _StoreusingSharedPreferencesState();
}

class _StoreusingSharedPreferencesState
    extends State<StoreusingSharedPreferences> {
  String? newvalue;
  FocusNode weightfocus = FocusNode();
  FocusNode heightfocus = FocusNode();
  void initState() {
    super.initState();
    getweightfordisplay();
  }

  void getweightfordisplay() async {
    var prefs = await SharedPreferences.getInstance();
    var getweight = prefs.getString('finalweightvaluestoredinsharedpref');
    var getheight= prefs.getString('finalHeightvaluestoredinsharedpref');
     weighdat = getweight != Null ? getweight : '0' ;
     heightdata  = getheight != Null ? getheight: '0' ;
    print('Getting Weight fromdatabase is $weighdat');
    print('Getting height fromdatabase is $heightdata');
    setState(() {
    });
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
          Text('Enter Weight in kgs'),
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
                var savedat = weightcontroller.text.toString();
                var heighttextfieldvalue = heightcontroller.text.toString();
                if (savedat.isEmpty || savedat == null) {
                  weightfocus.requestFocus();
                  print('enter some Values Plese');
                }else if(heighttextfieldvalue.isEmpty || heighttextfieldvalue == null){
                    heightfocus.requestFocus();
                    print('enter Height Plese');
                }
                 else {
                  weighdat = savedat;
                  heightdata = heighttextfieldvalue;
                  var pef = await SharedPreferences.getInstance();
                  var peftwo = await SharedPreferences.getInstance();
                  pef.setString(
                      'finalweightvaluestoredinsharedpref', weighdat!);
                      peftwo.setString('finalHeightvaluestoredinsharedpref',heightdata!);
                  print('Setting new value to databse weight  is $weighdat');
                  print('Setting new value of Height in database is  $heightdata');
                  setState(() {});
                }
              },
              child: Text('Save'),
            ),
          ),
        ],
      ),
    );
  }
}
