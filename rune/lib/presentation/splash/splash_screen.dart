import 'package:flutter/material.dart';
import 'package:rune/presentation/auth/auth.dart';
import 'package:rune/theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 42,
            child: Container(
              padding: const EdgeInsets.all(18.0),
              child: const Image(
                image: AssetImage("assets/splash.jpg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Flexible(
            flex: 58,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/waves.png"),
                    fit: BoxFit.cover,
                    alignment: Alignment.topLeft),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        Text("Rune", style: SplashTheme.textTheme.headline1),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          "lorem iosum do  dor sit amet id the simple lorem iosum  dor sit amet id the simple iosum  id the simple iosum   dor sit amet id the simple lorem iosum dodor sit amet id the simplevvv sample paragraph",
                          style: SplashTheme.textTheme.headline3,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 24.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: const Color.fromRGBO(228, 228, 220, 1),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => SignUpScreen()));
                            },
                            child: Text("Register",
                                style: SplashTheme.textTheme.labelMedium),
                            style: SplashTheme.buttonTheme,
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => SignInScreen()));
                            },
                            child: Text("Sign In",
                                style: SplashTheme.textTheme.labelMedium),
                            style: SplashTheme.transparentButton,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*
Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/splash.jpg'),
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
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (BuildContext context) =>
                        //             (SignUp())));
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
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (BuildContext context) =>
                        //             (SignIn())));
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
 */