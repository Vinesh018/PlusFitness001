import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? weighdat;

class StoreusingSharedPreferences extends StatefulWidget {
  @override
  State<StoreusingSharedPreferences> createState() =>
      _StoreusingSharedPreferencesState();
}

class _StoreusingSharedPreferencesState
    extends State<StoreusingSharedPreferences> {
  String? newvalue;
  FocusNode weightfocus = FocusNode();
  void initState() {
    super.initState();
    getweightfordisplay();
  }

  void getweightfordisplay() async {
    var prefs = await SharedPreferences.getInstance();
    var getweight = prefs.getString('finalweightvaluestoredinsharedpref');
     weighdat = getweight != Null ? getweight : '0' ;
    print('Getting Weight fromdatabase id $weighdat');
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
          Center(
            child: FloatingActionButton(
              onPressed: () async {
                var savedat = weightcontroller.text.toString();
                if (savedat.isEmpty || savedat == null) {
                  weightfocus.requestFocus();
                  print('enter some Values Plese');
                } else {
                  weighdat = savedat;
                  var pef = await SharedPreferences.getInstance();
                  pef.setString(
                      'finalweightvaluestoredinsharedpref', weighdat!);
                  print('Setting new value to databse is $weighdat');
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
