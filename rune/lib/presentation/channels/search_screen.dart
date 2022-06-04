import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:rune/application/blocs.dart';
import 'package:rune/presentation/channels/widgets/centerd_message.dart';
import 'package:rune/presentation/channels/widgets/channel_card.dart';
import 'package:rune/presentation/channels/widgets/search_header.dart';

class ChannelPage extends StatelessWidget {
  const ChannelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<ChannelBloc>().add(const LoadChannels());
    return Scaffold(
      body: ListView(
        // shrinkWrap: true,
        children: [
          const SearchHeader(),
          BlocConsumer<ChannelBloc, ChannelState>(
            listener: (context, state) {
              print(state);
            },
            builder: (context, state) {
              if (state is ChannelLoading) {
                return const CenteredMessage(
                    child: CircularProgressIndicator());
              }

              if (state is ChannelLoadedSuccessfuly) {
                if (state.channels.isEmpty) {
                  return CenteredMessage(
                    sad: true,
                    child: Text(
                      "No Channels Available yet",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.channels.length,
                  itemBuilder: (context, index) {
                    return ChannelCard(state.channels[index]);
                  },
                );
              }

              if (state is ChannleLoadingFailed) {
                return CenteredMessage(
                  sad: true,
                  child: Text(
                    state.errMsg,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 21,
                    ),
                  ),
                );
              }

              return Container();
            },
          )
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
