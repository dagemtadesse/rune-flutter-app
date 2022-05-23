import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rune/models/models.dart';
import 'package:rune/models/network/network.dart';
import 'package:rune/models/providers/provider.dart';

import '../theme.dart';

class ReactButtons extends StatefulWidget {
  final Post post;

  const ReactButtons({Key? key, required this.post}) : super(key: key);

  @override
  State<ReactButtons> createState() => _ReactButtonsState();
}

class _ReactButtonsState extends State<ReactButtons> {
  late String vote;
  late int upVoteCount;
  late int downVoteCount;

  _ReactButtonsState();

  @override
  void initState() {
    super.initState();
    vote = widget.post.vote;
    upVoteCount = widget.post.upVote;
    downVoteCount = widget.post.downVote;
  }

  @override
  Widget build(BuildContext context) {
    final repo = Provider.of<Repository>(context, listen: false);

    void react(bool isUpVote) async {
      await votePost(repo, widget.post.id, isUpVote);
      setState(() {
        vote = isUpVote ? "UP_VOTE" : "DOWN_VOTE";
      });
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () async {
                        react(true);
                      },
                      icon: const Icon(Icons.upload),
                      color: (vote == "UP_VOTE")
                          ? Colors.red
                          : RuneTheme.borderColor),
                  Text(
                    widget.post.upVote.toString(),
                    style: GoogleFonts.poppins(),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  IconButton(
                      onPressed: () {
                        react(false);
                      },
                      icon: Icon(Icons.download,
                          color: (vote == "DOWN_VOTE")
                              ? Colors.red
                              : RuneTheme.borderColor)),
                  Text(
                    widget.post.downVote.toString(),
                    style: GoogleFonts.poppins(),
                  )
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon:
                const Icon(Icons.comment_rounded, color: RuneTheme.borderColor),
          ),
        ],
      ),
    );
  }
}
