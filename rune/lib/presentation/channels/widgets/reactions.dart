import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rune/application/widgets/hero_dialog_route.dart';
import 'package:rune/domain/models.dart';
import 'package:rune/presentation/comments/post_comments/post_comments_screen.dart';
import 'package:rune/theme.dart';

class ReactButtons extends StatefulWidget {
  final Post post;

  const ReactButtons({Key? key, required this.post}) : super(key: key);

  @override
  State<ReactButtons> createState() => _ReactButtonsState();
}

class _ReactButtonsState extends State<ReactButtons> {
  late String _vote;
  late int _upVote;
  late int _downVote;

  _ReactButtonsState();

  @override
  void initState() {
    super.initState();
    _vote = widget.post.vote;
    _upVote = widget.post.upVote;
    _downVote = widget.post.downVote;
  }

  @override
  Widget build(BuildContext context) {
    void react(bool isUpVote) async {
      // final newVote = isUpVote ? "UP_VOTE" : "DOWN_VOTE";
      // final vote = (_vote != newVote) ? newVote : "NONE";
      // // final post = await votePost(repo, widget.post.id, vote);

      // setState(() {
      //   _vote = post.vote;
      //   _upVote = post.upVote;
      //   _downVote = post.downVote;
      // });
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
                      color: (_vote == "UP_VOTE")
                          ? Colors.red
                          : RuneTheme.borderColor),
                  Text(
                    _upVote.toString(),
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
                          color: (_vote == "DOWN_VOTE")
                              ? Colors.red
                              : RuneTheme.borderColor)),
                  Text(
                    _downVote.toString(),
                    style: GoogleFonts.poppins(),
                  )
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                HeroDialogRoute(
                  builder: (_) => Center(
                    child: CommentsScreen(
                      post: widget.post,
                    ),
                  ),
                ),
              );
            },
            icon:
                const Icon(Icons.comment_rounded, color: RuneTheme.borderColor),
          ),
        ],
      ),
    );
  }
}
