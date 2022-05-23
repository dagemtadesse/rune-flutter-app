import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rune/models/network/network.dart';
import 'package:rune/models/network/posts_request.dart';
import 'package:rune/widgets/widgets.dart';

import '../models/models.dart';
import '../models/providers/provider.dart';

class ChannelDetailsPage extends StatelessWidget {
  final BuildContext context;
  ChannelDetailsPage({Key? key, required this.context}) : super(key: key) {
    final repo = Provider.of<Repository>(context, listen: false);
    Provider.of<PageModel>(context, listen: false).posts =
        fetchPosts(repo: repo, channelId: 30);

    fetchUser(repo, 36)
        .then((value) => print(value))
        .onError((error, stackTrace) => print("woopsy"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PageModel>(
        builder: (context, pageModel, child) => FutureBuilder(
            future: pageModel.posts,
            builder: (context, AsyncSnapshot<Posts> posts) {
              if (posts.hasData) {
                return ListView.builder(
                  itemCount: posts.data!.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return const ChannelAppBar(
                        description:
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor incididu",
                        channelName: "Mechanical Engineering",
                      );
                    }
                    return PostCard(post: posts.data![index - 1]);
                  },
                );
              } else if (posts.hasError) {
                // Center(child: Text,)
              }

              return const Center(child: CircularProgressIndicator());
            }),
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
