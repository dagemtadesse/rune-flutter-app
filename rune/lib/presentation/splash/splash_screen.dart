import 'package:flutter/material.dart';
import 'package:rune/presentation/screens.dart';
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
