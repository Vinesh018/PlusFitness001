import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plus_fitness/Bhautik/b_userprofile.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool readonly = true;
String weightValue ='25';

class userdatacontainer extends StatefulWidget {
  @override
  State<userdatacontainer> createState() => _userdatacontainerState();
}

class _userdatacontainerState extends State<userdatacontainer> {
  void _toggle() {
    setState(() {
      readonly = false;
    });
  }
  addStringToSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('weighenterintextfield', weightValue);
}

  void _togglenot() {
    setState(() {
      readonly = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    TextEditingController _weightcontroller = TextEditingController();
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: screenHeight / 8),
            child: Text(
              'My Personal Detail',
              style: TextStyle(
                fontFamily: 'FontMain',
                fontSize: 20,
              ),
            ),
          ),
          TextFormField(
            controller: _weightcontroller,
            keyboardType: TextInputType.number,
            readOnly: readonly,
            decoration: InputDecoration(
                labelText: 'Enter Your Weight in kgs',
                suffixIcon: IconButton(
                    onPressed: () {
                      _toggle();
                    },
                    icon: Icon(Icons.edit)),
                border: InputBorder.none),
                onChanged: (value) {
                     print('First text field: $value');
                    weightValue = value;
                    print(weightValue);
                },
          ),
        ],
      ),
    );
  }
}
