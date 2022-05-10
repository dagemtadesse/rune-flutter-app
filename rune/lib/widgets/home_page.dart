import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/user.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text("Do network request"),
          onPressed: () async {
            User.login("jeff@jiffy.com", "JO45s!ehall*");
            // User.register("Jeff Dunham", "jeff@jiffy.com", "JO45s!ehall*");
          },
        ),
      ),
    );
  }
}
