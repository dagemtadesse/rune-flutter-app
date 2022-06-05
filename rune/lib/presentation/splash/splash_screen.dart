import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rune/application/blocs.dart';
import 'package:rune/theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final navCubit = context.read<NavigationCubit>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              constraints: BoxConstraints(minHeight: size.height / 2),
              padding: const EdgeInsets.all(18.0),
              child: const Image(
                image: AssetImage("assets/splash.jpg"),
                fit: BoxFit.fill,
              ),
            ),
            Container(
              constraints: BoxConstraints(minHeight: size.height / 2),
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/waves.png"),
                    fit: BoxFit.cover,
                    alignment: Alignment.topLeft),
              ),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Text("Rune", style: SplashTheme.textTheme.headline1),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      child: Text(
                        "Welcome to Rune. A public interactive platform for sharing and discussing your experiences. Dive into this community-based space to find and contribute answers regarding any and all service providing companies.",
                        style: SplashTheme.textTheme.headline3,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 24.0, bottom: 12.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: const Color.fromRGBO(228, 228, 220, 1),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                navCubit.toRegisterScreen();
                              },
                              child: Text("Register",
                                  style: SplashTheme.textTheme.labelMedium),
                              style: SplashTheme.buttonTheme,
                            ),
                          ),
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                navCubit.toLoginScreen();
                              },
                              child: Text("Sign In",
                                  style: SplashTheme.textTheme.labelMedium),
                              style: SplashTheme.transparentButton,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
