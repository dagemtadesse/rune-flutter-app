import 'package:flutter/material.dart';
import 'package:rune/domain/models.dart';

import 'package:rune/presentation/comments/widgets/reaction_count.dart';
import 'package:rune/presentation/post/widgets/card_info.dart';

class CommentCard extends StatelessWidget {
  final Comment comment;
  final Function press;
  const CommentCard({Key? key, required this.comment, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          top: 5.0,
          left: 15.0,
          right: 15.0,
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Colors.white,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CardDetails(user: comment.author),
                SizedBox(height: 12.0),
                Text(comment.content),
                SizedBox(height: 8.0),
                ReactionCount()
              ],
            ),
          ),
        ));
  }
}
