import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_icon/gradient_icon.dart';
import 'package:plus_fitness/Bhautik/Myprofilesubpages/StoreUserdata.dart';
import 'package:plus_fitness/Bhautik/Myprofilesubpages/personaldata.dart';
import 'package:plus_fitness/Bhautik/b_login.dart';
import 'package:plus_fitness/Vinesh/footer.dart';
import 'package:shared_preferences/shared_preferences.dart';

double screenWidth = 0;
double screenHeight = 0;
String? weighonbody;
String? Heightonbody;
String? namedataonbody;
String? ageonbody;


class UserProfileMainRun extends StatefulWidget {
  @override
  State<UserProfileMainRun> createState() => _UserProfileMainRunState();
}

class _UserProfileMainRunState extends State<UserProfileMainRun> {
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
    weighonbody = getweight != Null ? getweight : '0';
    Heightonbody = getheight != Null ? getheight : '0';
    namedataonbody  = getname != Null ? getname: 'myname' ;
    ageonbody  = getage != Null ? getage: '22' ;

    print('Getting Weight from database is in third page $weighonbody');
    print('Getting height from database is in third page $Heightonbody');
    print('Gettin name from database is in third page $namedataonbody');
    print('Gettin age from database is in fourth page $ageonbody');
    setState(() {});
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 231, 235, 237),
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Color.fromARGB(255, 231, 235, 237),
        title: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Text("My Profile"),
        ),
      ),
      bottomNavigationBar: footer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            NameImageRow(),
            HeightWeightAge(),
            AccountContainer(heading: "Account",),
            AccountContainerforother(heading: 'Others')
          ],
        ),
      ),
    );
  }
}

class NameImageRow extends StatefulWidget {
  @override
  State<NameImageRow> createState() => _NameImageRowState();
}

class _NameImageRowState extends State<NameImageRow> {
  
  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width;
    double y = MediaQuery.of(context).size.height;
    screenWidth = x;
    screenHeight = y;
    return ListTile(
      leading: SizedBox(
        width: 50,
        height: 80,
        child: CircleAvatar(
            radius: 100,
            backgroundColor: Color.fromARGB(255, 231, 235, 237),
            child: Image.asset(
              'assets/images/userprofile.png',
              height: 200,
              width: 200,
            )),
      ),
      title:

       Text(
       namedataonbody.toString(),
        style: TextStyle(fontFamily: 'FontMain', fontSize: 19),
      ),
      // subtitle: Text(
      //   'Lose a Fat Progam',
      //   style: TextStyle(
      //       fontFamily: 'FontMain', color: Colors.grey.shade700, fontSize: 14),
      // ),
      trailing: InkWell(
        onTap: () {
          FirebaseAuth.instance.signOut();
          
          Get.off(MainLogInPage());
        },
        child: Container(
          width: screenWidth/3,
          height: 40,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.indigo.shade100, Colors.indigo.shade500]),
              borderRadius: BorderRadius.circular(40)),
          child: ElevatedButton(
            onPressed: null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              
                Text(
                  'Logout',
                  style: TextStyle(
                      fontFamily: 'FontMain', color: Colors.white, fontSize: 16),
                ),
                SizedBox(
                  width: 6,
                ),
                  Icon(
                  Icons.logout_rounded,
                  size: 15,
                  color: Colors.white,
                ),
                
              ],
            ),
            style: ElevatedButton.styleFrom(
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35))),
          ),
        ),
      ),
    );
  }
}
String? weightvaluefromsharedprefrence;
class HeightWeightAge extends StatefulWidget {
  @override
  State<HeightWeightAge> createState() => _HeightWeightAgeState();
}

class _HeightWeightAgeState extends State<HeightWeightAge> {

  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Card(
            shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.all(Radius.elliptical(15, 11)),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.indigo.shade50,
                border: Border.all(color: Colors.grey.shade500),
                borderRadius: BorderRadius.all(Radius.elliptical(15, 11)),
              ),
              child: SizedBox(
                width: screenWidth / 4,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(Heightonbody.toString()),
                          // GradientText(

                          //   Heightonbody!,

                          //   style:
                          //       TextStyle(fontSize: 15, fontFamily: 'FontMain'),
                          //   gradient: LinearGradient(colors: [
                          //     Colors.indigo.shade300,
                          //     Colors.indigo.shade600
                          //   ]),
                          // ),
                          GradientText(
                            ' cm',
                            style:
                                TextStyle(fontSize: 15, fontFamily: 'FontMain'),
                            gradient: LinearGradient(colors: [
                              Colors.indigo.shade700,
                              Colors.indigo.shade800
                            ]),
                          )
                        ],
                      ),
                      Text(
                        'Height',
                        style: TextStyle(
                            fontFamily: 'FontMain', color: Colors.grey.shade600),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.all(Radius.elliptical(15, 11)),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.indigo.shade50,
                border: Border.all(color: Colors.grey.shade500),
                borderRadius: BorderRadius.all(Radius.elliptical(15, 11)),
              ),
              child: SizedBox(
                width: screenWidth / 4,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(weighonbody.toString()),
                          // GradientText(
                          //   weighonbody!,
                          //   style:
                          //       TextStyle(fontSize: 15, fontFamily: 'FontMain'),
                          //   gradient: LinearGradient(colors: [
                          //     Colors.indigo.shade300,
                          //     Colors.indigo.shade600
                          //   ]),
                          // ),
                          GradientText(
                            ' kg',
                            style:
                                TextStyle(fontSize: 15, fontFamily: 'FontMain'),
                            gradient: LinearGradient(colors: [
                              Colors.indigo.shade700,
                              Colors.indigo.shade800
                            ]),
                          )
                        ],
                      ),
                      Text(
                        'Weight',
                        style: TextStyle(
                            fontFamily: 'FontMain', color: Colors.grey.shade600),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.all(Radius.elliptical(15, 11)),
            ),
          child: Container(
              decoration: BoxDecoration(
                color: Colors.indigo.shade50,
                border: Border.all(color: Colors.grey.shade500),
                borderRadius: BorderRadius.all(Radius.elliptical(15, 11)),
              ),
              child: SizedBox(
                width: screenWidth / 4,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(ageonbody.toString()),
                          // GradientText(
                          //   '22',
                          //   style:
                          //       TextStyle(fontSize: 15, fontFamily: 'FontMain'),
                          //   gradient: LinearGradient(colors: [
                          //     Colors.indigo.shade300,
                          //     Colors.indigo.shade600
                          //   ]),
                          // ),
                          GradientText(
                            ' yo',
                            style:
                                TextStyle(fontSize: 15, fontFamily: 'FontMain'),
                            gradient: LinearGradient(colors: [
                              Colors.indigo.shade700,
                              Colors.indigo.shade800
                            ]),
                          )
                        ],
                      ),
                      Text(
                        'Age',
                        style: TextStyle(
                            fontFamily: 'FontMain', color: Colors.grey.shade600),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}

class AccountContainer extends StatefulWidget {

  final String heading;

  const AccountContainer({required this.heading});

  @override
  State<AccountContainer> createState() => _AccountContainerState();
}

class _AccountContainerState extends State<AccountContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 25),
      child: Card(
        shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
              topRight: Radius.circular(110)
            )
        ),
        color: Colors.indigo.shade50,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade500),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
              topRight: Radius.circular(110)
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    widget.heading,
                    style: TextStyle(fontFamily: 'FontMainBold', fontSize: 22),
                  ),
                ),
                OneListtileForAccountData(icons: Icons.person_outline_rounded,str: 'Personal Data',ontap:  Personaldataontap,),
                OneListtileForAccountData(icons: Icons.sticky_note_2_outlined,str: 'Achievement',ontap: Personaldataontap),
                OneListtileForAccountData(icons: Icons.data_saver_on_sharp,str: 'Activity History',ontap: Personaldataontap),
                OneListtileForAccountData(icons: Icons.sports_handball_rounded,str: 'Workout Progress',ontap: Personaldataontap),
              ],
            ),
          ),
        ),
      ),
    );
  }
   Personaldataontap() async{
  await Get.off(PersonalDataMainShow());
  setState(() {
  });
}
}

class AccountContainerforother extends StatefulWidget {

  final String heading;

  const AccountContainerforother({required this.heading});

  @override
  State<AccountContainerforother> createState() => _AccountContainerforotherState();
}

class _AccountContainerforotherState extends State<AccountContainerforother> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 25,bottom: 20),
      child: Card(
        shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
              topRight: Radius.circular(110)
            )
        ),
        color: Colors.indigo.shade50,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade500),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
              topRight: Radius.circular(110)
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    widget.heading,
                    style: TextStyle(fontFamily: 'FontMainBold', fontSize: 22),
                  ),
                ),
                OneListtileForAccountData(icons: Icons.mail_outline,str: 'Contact Us',ontap: Personaldataontap),
                OneListtileForAccountData(icons: Icons.privacy_tip_outlined,str: 'Privacy Policy',ontap: Personaldataontap),
                OneListtileForAccountData(icons: Icons.settings,str: 'Setting',ontap: Personaldataontap),
              ],
            ),
          ),
        ),
      ),
    );
  }

     Personaldataontap() async{
  await Get.to(PersonalDataMainShow());
  setState(() {
  });
}
}

class OneListtileForAccountData extends StatelessWidget {
final IconData icons;
final String str;
final Function ontap;

  const OneListtileForAccountData({ required this.icons, required this.str,required this.ontap});

  @override
  Widget build(BuildContext context) {
return  ListTile(
          onTap: () {
            ontap();
          },
          leading: GradientIcon(
            icon: icons,
            gradient: LinearGradient(
              colors: [Colors.red, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            size:29,
          ),
          title: Padding(
            padding: const EdgeInsets.only(top:10),
            child: Text(str,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
          ),
          trailing: InkWell(
            child:  GradientIcon(
            icon: Icons.arrow_forward_ios,
            gradient: LinearGradient(
              colors: [ Colors.blue,Colors.red,],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            size: 20,
          ),
          ),
        );
  }
  
}

