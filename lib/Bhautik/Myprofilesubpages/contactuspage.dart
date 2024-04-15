import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plus_fitness/Bhautik/b_userprofile.dart';
import 'package:http/http.dart' as http;

final globalkey = GlobalKey<ScaffoldMessengerState>();

TextEditingController subjectController = TextEditingController();
TextEditingController messageController = TextEditingController();
var flag = 0;

class ContactusPageMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: globalkey,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 231, 235, 237),
        appBar: AppBar(
          title: Text(
            "Contact Us",
            style: TextStyle(fontFamily: "FontMain", fontSize: 22),
          ),
          backgroundColor: Color.fromARGB(255, 231, 235, 237),
          leading: IconButton(
              onPressed: () {
                Get.off(UserProfileMainRun());
              },
              icon: Icon(Icons.arrow_back_ios)),
          surfaceTintColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                conatactusheading(),
                contactusText(),
                contactusmessage(),
                contactussubmit()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget contactusText() {
    TextStyle textstyle = TextStyle(
        color: Colors.grey.shade500, fontSize: 15, fontFamily: 'FontMain');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
      child: Text(
        "By clicking Submit, you acknowledge Plusfitness may review diagonostic and peformance information and the data associated with your account to try to troubleshoot and solve your reported issue. ",
        style: textstyle,
      ),
    );
  }

  Widget conatactusheading() {
    TextStyle headintextstyle1 =
        TextStyle(color: Colors.indigo, fontSize: 35, fontFamily: 'FontMain');
    TextStyle headintextstyle = TextStyle(
        color: Colors.indigo.shade300,
        fontSize: 25,
        fontFamily: 'FontMainLight');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Have questions?',
                style: headintextstyle1,
              ),
              Text(
                'Shoot us an email.',
                style: headintextstyle,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget contactusmessage() {
    TextStyle msgheading = TextStyle(
        color: Colors.indigo.shade800, fontSize: 20, fontFamily: 'FontMain');

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Subject",
              style: msgheading,
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              controller: subjectController,
              decoration: InputDecoration(
                fillColor: Colors.indigo.shade700,
                icon: Icon(Icons.subject, color: Colors.indigo.shade300),
                hintStyle: TextStyle(fontFamily: "FontMain", fontSize: 16),
                hintText: "Subject",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                "Message",
                style: msgheading,
              ),
            ),
            TextField(
              minLines: 5,
              maxLines: 6,
              keyboardType: TextInputType.multiline,
              controller: messageController,
              decoration: InputDecoration(
                fillColor: Colors.indigo.shade700,
                icon: Icon(Icons.message, color: Colors.indigo.shade300),
                hintStyle: TextStyle(fontFamily: "FontMain", fontSize: 16),
                hintText: '"Tell us how we can help"',
              ),
            ),
          ]),
    );
  }

  Widget contactussubmit() {
    TextStyle textstyle = TextStyle(
        fontFamily: "FontMain", fontSize: 16, color: Colors.indigo.shade300);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "We will respond through Email",
            style: textstyle,
          ),
          ElevatedButton(
              onPressed: () {
                sendemailjsemail();

                messageController.clear();
                subjectController.clear();

                var snackbar = SnackBar(
                  content: const Text('Email Sent to PLusfitness Dev'),
                  action: SnackBarAction(
                    label: 'Ok',
                    onPressed: () {
                      // Some code to undo the change.
                    },
                  ),
                );

                globalkey.currentState?.showSnackBar(snackbar);

                FocusManager.instance.primaryFocus?.unfocus();
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Colors.indigo.shade300)),
              child: Text(
                "Submit",
                style: TextStyle(color: Colors.white, fontFamily: "FontMain"),
              ))
        ],
      ),
    );
  }
}

//emailjs403
Future sendemailjsemail() async {
 // print("object");
  final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");

  const service_id = "service_p7512xo";
  const template_id = "template_aimkd99";
  const user_id = "o-6LgMbG7GOkJGWYp";

  final response = await http.post(url,
      headers: {'origin': 'http:localhost', 'Content-Type': 'application/json'},
      body: json.encode({
        'service_id': service_id,
        'template_id': template_id,
        'user_id': user_id,
        'template_params': {
          'subject': subjectController.text,
          'message': messageController.text,
          'from_name': "Plusfitness Contact us",
          'reply_to': "vinesh.thakkar.coen@gmail.com"
        }
      }));
 // print("object1");
 // print(response.statusCode);
  if (response.statusCode == 200) {
   // print("0982034580285025");
  //  print(flag);
    flag = 1;
  //  print(flag);
  //  print("0982034580285025");
  }
 // print(flag);
  // return response.statusCode;
}

void showSnackbar(String value) {}
