import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class privacypolicy extends StatefulWidget {
  const privacypolicy({super.key});

  @override
  State<privacypolicy> createState() => _privacypolicyState();
}

class _privacypolicyState extends State<privacypolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Privacy Policy",
            style: TextStyle(
                fontFamily: 'FontMain', fontSize: 22, color: Colors.indigo),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.indigo.shade800,
                  Colors.indigo.shade400,
                  const Color(0xFF00CCFF),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.0, 0.4, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Plusfitness",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "FonatMain",
                      fontSize: 30),
                ),
                Text(
                  "Version 1.2.1",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "FonatMain",
                      fontSize: 15),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Image.asset(
                    "assets/images/plusLogo.png",
                    height: 110,
                    width: 110,
                  ),
                ),
                InkWell(
                  onTap: _launchURL,
                  child: Text(
                    "Privacy Policy",
                    style: TextStyle(
                        color: Colors.indigo.shade50,
                        decoration: TextDecoration.underline,
                        fontSize: 18),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  _launchURL() async {
    Uri _url = Uri.parse('https://vinesh0187.github.io/plusfitness.github.io/');
    if (await launchUrl(_url)) {
      await launchUrl(_url);
    } else {
      throw 'Could not launch $_url';
    }
  }
}
