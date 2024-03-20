import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:plus_fitness/Bhautik/database.dart';
import 'package:plus_fitness/main.dart';

class GoogleAuth {
  final FirebaseAuth auth = FirebaseAuth.instance;

  getCrrentUser() async {
    return await auth.currentUser;
  }

  signInwithGoogle(BuildContext context) async {
    final FirebaseAuth firebaseauth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    final GoogleSignInAuthentication? googleSignInAuthentication =
        await googleSignInAccount?.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication?.idToken,
        accessToken: googleSignInAuthentication?.accessToken);

    UserCredential result = await firebaseauth.signInWithCredential(credential);

    User? userDetails = result.user;

    if (result != null) {
      Map<String, dynamic> userInfoMap = {
        "email": userDetails!.email,
        "name": userDetails.displayName,
        "imgUrl": userDetails.photoURL,
        "id": userDetails.uid,
        "weight": "65",
        "height": "56"
       
      };
      await DatabaseMethods()
          .addUser(userDetails.uid, userInfoMap)
          .then((value) => Get.off(TutorialHome()));
    }
  }
}
