import 'package:flutter/material.dart';

class ReactionCount extends StatefulWidget {
  const ReactionCount({Key? key}) : super(key: key);

  @override
  State<ReactionCount> createState() => _ReactionCountState();
}

class _ReactionCountState extends State<ReactionCount> {
  int upvoteCounter = 0;
  int downvoteCounter = 0;
  bool isUpvoted = false;
  bool isDownvoted = false;
  Color iconColorUp = Colors.black;
  Color iconColorDown = Colors.black;

  void incrementUpvote() {
    setState(() {
      upvoteCounter++;
      isUpvoted = true;
    });
  }

  void decrementUpvote() {
    setState(() {
      upvoteCounter--;
      isUpvoted = false;
    });
  }

  void incrementDownvote() {
    setState(() {
      downvoteCounter++;
      isDownvoted = true;
    });
  }

  void decrementDownvote() {
    setState(() {
      downvoteCounter--;
      isDownvoted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20,left: 10),
      child: Row(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  if (isUpvoted) {
                    decrementUpvote();
                    iconColorUp = Colors.black;
                  } else if (isDownvoted && !isUpvoted) {
                    decrementDownvote();
                    incrementUpvote();
                    iconColorDown = Colors.black;
                    iconColorUp = Colors.orange;
                  } else {
                    incrementUpvote();
                    iconColorUp = Colors.orange;
                  }
                },
                icon: ImageIcon(AssetImage("assets/icons/upvote_icon.png")),
                color: iconColorUp,
              ),
              Text(upvoteCounter.toString())
            ],
          ),
          SizedBox(
            width: 8,
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  if (isDownvoted) {
                    decrementDownvote();
                    iconColorDown = Colors.black;
                  } else if (isUpvoted && !isDownvoted) {
                    decrementUpvote();
                    incrementDownvote();
                    iconColorDown = Colors.orange;
                    iconColorUp = Colors.black;
                  } else {
                    incrementDownvote();
                    iconColorDown = Colors.orange;
                  }
                },
                icon: ImageIcon(AssetImage("assets/icons/downvote_icon.png")),
                color: iconColorDown,
              ),
              Text(downvoteCounter.toString())
            ],
          )
        ],
      ),
    );
  }
}
