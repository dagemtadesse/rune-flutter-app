import 'package:flutter/material.dart';
import 'signin_page.dart';
import 'signup_page.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage("assets/splash.jpg"),
            height: 270,
          ),
          Container(
            padding: EdgeInsets.only(bottom: 25, top: 89.27),
            child: Text(
              "Rune",
              style: TextStyle(
                  fontSize: 40,
                  fontFamily: "OpenSans",
                  fontWeight: FontWeight.w800),
            ),
          ),
          Container(
              child: Text(
                "lorem iosum do  dor sit amet id the simple lorem iosum  dor sit amet id the simple iosum  id the simple iosum   dor sit amet id the simple lorem iosum dodor sit amet id the simplevvv sample paragraph",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "OpenSans",
                ),
              ),
              padding: EdgeInsets.only(
                left: 16,
                right: 14.7,
              )),
          Container(
            padding:
                EdgeInsets.only(left: 16, right: 14.7, bottom: 81.25, top: 124),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 171.5,
                  height: 44,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    (SignUp())));
                      },
                      child: Text("Register"),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(18, 18, 18, 1.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      )),
                ),
                SizedBox(
                  width: 171.5,
                  height: 44,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    (SignIn())));
                      },
                      child: Text(
                        "Sign in ",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(255, 255, 255, 1.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
