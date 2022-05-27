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
    final pageModel = Provider.of<PageModel>(context, listen: false);
    pageModel.posts = fetchPosts(repo: repo, channelId: 30);
    pageModel.channel = fetchChannel(repo, pageModel.currentChannelId!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PageModel>(
        builder: (context, pageModel, child) => FutureBuilder(
          future: pageModel.channel,
          builder: (context, AsyncSnapshot<Channel> channel) {
            if (channel.hasData) {
              return FutureBuilder(
                  future: (pageModel.posts),
                  builder: (context, AsyncSnapshot<Posts> posts) {
                    if (posts.hasData) {
                      return ListView.builder(
                        itemCount: posts.data!.length + 1,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return ChannelAppBar(channel: channel.data!);
                          }
                          return PostCard(post: posts.data![index - 1]);
                        },
                      );
                    } else if (posts.hasError) {
                      // Center(child: Text,)
                    }

                    return const Center(child: CircularProgressIndicator());
                  });
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
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
                return PostForm();
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
