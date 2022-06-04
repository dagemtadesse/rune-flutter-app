import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rune/application/post/bloc/post_bloc.dart';
import 'package:rune/presentation/channels/widgets/post_card.dart';
import 'package:rune/domain/models.dart';
import 'package:rune/presentation/channels/widgets/centerd_message.dart';
import 'package:rune/presentation/channels/widgets/channel_app_bar.dart';
import 'package:rune/presentation/post/post_form.dart';

class ChannelDetailsPage extends StatelessWidget {
  final Channel channel;
  const ChannelDetailsPage({Key? key, required this.channel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<PostBloc>().add(LoadChannelsPosts(channel.id));
    final _key = GlobalKey();
    return Scaffold(
      body: ListView(
        children: [
          ChannelAppBar(channel: channel),
          BlocConsumer<PostBloc, PostState>(
            listener: (context, state) {
              print(state);
            },
            builder: (context, state) {
              if (state is LoadingPosts) {
                return const CenteredMessage(
                    child: CircularProgressIndicator());
              } else if (state is LoadingPostsSucced) {
                if (state.posts.isEmpty) {
                  return CenteredMessage(
                    sad: true,
                    child: Text(
                      "No Posts Available yet",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 21,
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: state.posts.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return PostCard(post: state.posts[index]);
                  },
                );
              } else if (state is LoadingPostFailed) {
                return CenteredMessage(
                  sad: true,
                  child: Text(
                    state.errorMessage,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                    ),
                  ),
                );
              }

              return Container();
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            context: context,
            builder: (_) {
              return PostForm(
                key: _key,
              );
            },
          );
        }),
        child: const Icon(
          Icons.add,
          size: 24.0,
        ),
      ),
    );
  }
}
