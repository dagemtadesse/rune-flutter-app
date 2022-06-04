import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rune/application/comment/bloc/comment_bloc.dart';
import 'package:rune/domain/models.dart';
import 'package:rune/infrastructure/repositories.dart';
import 'package:rune/presentation/channels/widgets/centerd_message.dart';
import 'package:rune/presentation/comments/widgets/comment_text_field.dart';
import '../widgets/comment_card.dart';
import 'dart:developer' as developer;

class CommentsScreen extends StatelessWidget {
  final Post post;
  CommentsScreen({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userRepository = context.read<UserRepository>();
    final commentRepository = context.read<CommentRepository>();

    return BlocProvider(
      create: (context) => CommentBloc(
        commentRepository,
        userRepository,
      )..add(LoadComments(post.id)),
      child: Scaffold(
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocConsumer<CommentBloc, CommentState>(
              listener: (context, state) {
                if (state is CommentAddSuccessfuly) {
                  context.read<CommentBloc>().add(LoadComments(post.id));
                }
              },
              builder: (context, state) {
                developer.log("$state");

                if (state is CommentLoading) {
                  return Expanded(
                      child: Center(child: CircularProgressIndicator()));
                }

                if (state is CommentLoadingFailed) {
                  return CenteredMessage(
                      child: Text(state.message,
                          style: GoogleFonts.poppins(
                              fontSize: 20, color: Colors.white)));
                }

                if (state is CommentLoadingSucceded) {
                  if (state.comments.isEmpty) {
                    return CenteredMessage(
                        child: Text("No comments Yet",
                            style: GoogleFonts.poppins(
                                fontSize: 20, color: Colors.white)));
                  }
                  return Expanded(
                    child: ListView.builder(
                        itemCount: state.comments.length,
                        itemBuilder: (context, index) => CommentCard(
                              comment: state.comments[index],
                              press: () {},
                            )),
                  );
                }

                return Container();
              },
            ),
            CommentTextField(post: post)
          ],
        ),
      ),
    );
  }
}
