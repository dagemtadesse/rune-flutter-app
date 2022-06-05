import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rune/application/comment/bloc/comment_bloc.dart';
import 'package:rune/domain/models.dart';
import 'dart:developer' as developer;

class CommentTextField extends StatelessWidget {
  final Post post;
  CommentTextField({
    Key? key,
    required this.post,
  }) : super(key: key);

  final commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: TextField(
        controller: commentController,
        decoration: InputDecoration(
          hintText: "write your comment here",
          suffixIcon: IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                if (!commentController.text.isEmpty)
                  context.read<CommentBloc>().add(
                      AddComment(post.id, comment: commentController.text));
              }),
        ),
      ),
    );
  }
}
