import 'package:flutter/material.dart';
import 'package:rune/widgets/host_page.dart';
import 'package:rune/widgets/splash_page.dart';


void main() {
  runApp(const RuneApp());
}

class RuneApp extends StatelessWidget {
  const RuneApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      home:  MySplashPage( title: "Rune",),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MySplashPage extends StatefulWidget {
   const MySplashPage({Key? key, required this.title}) : super(key: key);
    final String title;

  @override
  State<MySplashPage> createState() => _MySplashPageState();
}

class _MySplashPageState extends State<MySplashPage> {
  @override
  Widget build(BuildContext context) {
    return Splash();
  }
}