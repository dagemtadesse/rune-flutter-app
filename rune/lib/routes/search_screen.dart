import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rune/models/network/channel_request.dart';
import 'package:rune/models/providers/provider.dart';
import 'package:rune/widgets/channel_card.dart';
import 'package:rune/widgets/search_header.dart';
import '../models/channel.dart';
import '../widgets/widgets.dart';

class ChannelPage extends StatelessWidget {
  const ChannelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repo = Provider.of<Repository>(context, listen: false);
    final pageModel = Provider.of<PageModel>(context);
    pageModel.channels = fetchChannels(repo,
        searchKey: pageModel.channelQuery,
        order: pageModel.order,
        pinned: pageModel.channelTab == ChannelTab.pinned);

    return Scaffold(
      body: Consumer<PageModel>(
        builder: ((context, pageModel, child) => FutureBuilder(
              future: pageModel.channels,
              builder: (context, AsyncSnapshot<Channels> data) {
                if (data.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.data!.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return const SearchHeader();
                      }
                      final channel = data.data![index - 1];
                      return ChannelCard(channel);
                    },
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            )),
      ),
      backgroundColor: Colors.white,
    );
  }
}
