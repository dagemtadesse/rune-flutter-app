import 'package:flutter/material.dart';
import 'package:rune/routes/routes.dart';

void main() {
  runApp(const RuneApp());
}

class RuneApp extends StatelessWidget {
  const RuneApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}
