import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rune/application/vote/bloc/votebloc_bloc.dart';
import 'package:rune/domain/models.dart';
import 'package:rune/infrastructure/repositories.dart';
import 'package:rune/presentation/comments/post_comments_screen.dart';
import 'package:rune/presentation/comments/widgets/hero_dialog_route.dart';
import 'package:rune/theme.dart';

class ReactButtons extends StatelessWidget {
  final dynamic post;
  final String artifactType;

  const ReactButtons({Key? key, required this.post, this.artifactType = "post"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final voteBloc = VoteBloc(
        context.read<PostRepository>(),
        context.read<UserRepository>(),
        context.read<CommentRepository>(),
        Voted(post));

    return BlocProvider(
      create: (context) => voteBloc,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                BlocBuilder<VoteBloc, VoteState>(builder: (context, state) {
                  final post = (state as Voted).artifact;
                  return Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            final type =
                                post.vote == "UP_VOTE" ? "NONE" : "UP_VOTE";
                            voteBloc.add(Vote(type, state.artifact,
                                artifactType: artifactType));
                          },
                          icon: const Icon(Icons.upload),
                          color: (post.vote == "UP_VOTE")
                              ? Colors.red
                              : RuneTheme.borderColor),
                      Text(
                        post.upVote.toString(),
                        style: GoogleFonts.poppins(),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      IconButton(
                          onPressed: () {
                            final type =
                                post.vote == "DOWN_VOTE" ? "NONE" : "DOWN_VOTE";
                            voteBloc.add(Vote(type, state.artifact,
                                artifactType: artifactType));
                          },
                          icon: Icon(Icons.download,
                              color: (state.artifact.vote == "DOWN_VOTE")
                                  ? Colors.red
                                  : RuneTheme.borderColor)),
                      Text(
                        post.downVote.toString(),
                        style: GoogleFonts.poppins(),
                      )
                    ],
                  );
                }),
              ],
            ),
            if (artifactType != "comment")
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    HeroDialogRoute(
                      builder: (_) => Center(
                        child: CommentsScreen(
                          post: post,
                        ),
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.comment_rounded,
                    color: RuneTheme.borderColor),
              ),
          ],
        ),
      ),
    );
  }
}
