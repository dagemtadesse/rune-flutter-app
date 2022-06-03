import 'package:flutter/material.dart';
import 'package:rune_app/models/popupComment_model.dart';
import 'package:rune_app/screens/comments/components/commentTextField.dart';
import 'package:rune_app/screens/comments/components/reaction_count.dart';






Widget buildCard() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) => CommentCard(
                  comment: comments[index],
                  press: () {},
            )),
        ),
        CommentTextField()
      ],  
    );
  }

class CommentCard extends StatelessWidget {
  final Comment comment;
  final Function press;
  const CommentCard({Key? key, required this.comment, required this.press})
      : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 5.0,left:15.0,right: 15.0,),
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          color: Colors.white,
          elevation: 0,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Stack(
                  children:[ 
                    Row(
                    // mainAxisSize: MainAxisSize.max,
                      children: [
                         CircleAvatar(
                          backgroundImage:
                              AssetImage(comment.image),
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
                        ), 
                      ],
                    ),
                    Positioned(
                      top: 10,
                      right: 0,
                      child:IconButton(
                        icon: Icon(Icons.more_vert),
                        onPressed: (){},
                      )
                    ),

                  ]
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


