import 'package:flutter/material.dart';
import 'package:rune/widgets/host_page.dart';

void main() {
  runApp(const RuneApp());
}

class RuneApp extends StatelessWidget {
  const RuneApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HostPage(),
    );
  }
}
