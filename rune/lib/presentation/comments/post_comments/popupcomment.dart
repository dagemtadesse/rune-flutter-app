import 'package:flutter/material.dart';
import '../../../application/widgets/commentcard.dart';


class PopUpComment extends StatelessWidget {
  const PopUpComment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          // color: Colors.transparent,
          icon: Icon(Icons.close),
          onPressed: Navigator.of(context).pop,
        ),
      ),
      
      
      body: buildCard(),
    );
  }
}

