import 'package:flutter/material.dart';

import 'widgets/mycomments_card.dart';
import 'widgets/widgets.dart';

class MyComments extends StatelessWidget {
  const MyComments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [buildCard()],
        ),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
