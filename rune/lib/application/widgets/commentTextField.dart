import 'package:flutter/material.dart';



class CommentTextField extends StatelessWidget {
  const CommentTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child:Container(
        padding: EdgeInsets.symmetric(horizontal:5),
        decoration:BoxDecoration(
          color:Colors.white,
        ),
        child: TextField(
        decoration: InputDecoration(
          hintText: "write your comment here",
          suffixIcon:IconButton(
            icon: Icon(Icons.send),
            onPressed:(){}
          )
        ),
    ),
      )
    );
  }
}