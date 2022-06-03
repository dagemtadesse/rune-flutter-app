import 'package:flutter/material.dart';
import 'package:rune_app/models/comment_model.dart';
import 'package:rune_app/screens/comments/components/commentTextField.dart';
import 'package:rune_app/screens/comments/components/commentcard.dart';


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

  

  // Widget buildPopUp() {
  //   return Padding(
  //     padding: EdgeInsets.all(8),
  //     child:buildCard()
  //   );
  // }
}

