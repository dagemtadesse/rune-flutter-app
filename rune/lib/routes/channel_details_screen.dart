import 'package:flutter/material.dart';
import 'package:rune/widgets/widgets.dart';

import '../models/models.dart';

class ChannelDetailsPage extends StatelessWidget {
  const ChannelDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User flash = User(
      id: 0,
      fullName: "Flash Thompson",
      email: "flash@mail.com",
    );

    final posts = [
      Post(
          postTitle: "Post Title",
          datePublished: DateTime.now(),
          publisher: flash,
          postContent:
              "This is the random post content apparently wow wow wow wow "),
      Post(
          postTitle: "Post Title",
          datePublished: DateTime.now(),
          publisher: flash,
          postImage: "",
          postContent:
              "This is the random post content apparently wow wow wow wow "),
    ];

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
