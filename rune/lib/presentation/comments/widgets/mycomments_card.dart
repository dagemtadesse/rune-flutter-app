import 'package:flutter/material.dart';
import '../../../domain/comment/mycomment_model.dart';

import '../../../domain/channel/mychannels_model.dart';
import 'reaction_count.dart';

Widget buildCard() {
  return Expanded(
    child: GridView.builder(
        itemCount: channels.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, childAspectRatio: 1.3),
        itemBuilder: (context, index) => CommentCard(
              comment: mycomments[index],
              press: () {},
            )),
  );
}

class CommentCard extends StatelessWidget {
  final MyComment comment;
  final Function press;
  const CommentCard({Key? key, required this.comment, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          top: 0.0,
          left: 0.0,
          right: 0.0,
        ),
        child: Card(
          color: Colors.white,
          elevation: 0,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/images/img_avatar1.png"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(comment.profileName),
                          Text(comment.dateCommented)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(comment.description),
              ),
              ReactionCount()
            ],
          ),
        ));
  }
}
