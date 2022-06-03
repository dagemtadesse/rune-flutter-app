import 'package:flutter/material.dart';

import '../../../application/widgets/channel_app_bar.dart';
import '../../../application/widgets/post_card.dart';
import '../../../domain/post/post_model.dart';
import '../../../domain/user/user_model.dart';
import '../../post/post_form/post_form.dart';

class ChannelDetailsPage extends StatelessWidget {
  const ChannelDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final posts = [];

    return Scaffold(
      body: ListView.builder(
        itemCount: posts.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return const ChannelAppBar(
              description:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor incididu",
              channelName: "Mechanical Engineering",
            );
          }
          return PostCard(post: posts[index - 1]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() => showModalBottomSheet(
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              context: context,
              builder: (_) {
                return const PostForm();
              },
            )),
        child: const Icon(
          Icons.add,
          size: 30.0,
        ),
      ),
    );
  }
}
