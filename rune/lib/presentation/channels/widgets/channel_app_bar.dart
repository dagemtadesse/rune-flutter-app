import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rune/application/blocs.dart';
import 'package:rune/domain/models.dart';

class ChannelAppBar extends StatelessWidget {
  final Channel channel;

  const ChannelAppBar({Key? key, required this.channel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final background = (channel.logo != null)
        ? NetworkImage(channel.logo!)
        : const AssetImage("assets/mechanical.jpg");

    return Stack(
      children: [
        Container(
          constraints:
              const BoxConstraints.expand(height: 260, width: double.infinity),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: background as ImageProvider, fit: BoxFit.cover),
          ),
        ),
        /////
        Container(
          constraints: const BoxConstraints.expand(
            height: 260,
            width: double.infinity,
          ),
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  BlocBuilder<ChannelBloc, ChannelState>(
                    builder: (context, state) {
                      final isPinned = (state is PinnedChannel)
                          ? state.isPinned
                          : channel.pinned;

                      return IconButton(
                        onPressed: () async {
                          context
                              .read<ChannelBloc>()
                              .add(PinChannel(channel, isPinned));
                        },
                        icon: Icon(!isPinned
                            ? Icons.bookmark_add_outlined
                            : Icons.bookmark),
                        color: Colors.white,
                      );
                    },
                  ),
                  const SizedBox(width: 18),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Text(
                        channel.name,
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Text(
                        channel.description,
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 15.0),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                        ),
                      ),
                      constraints: const BoxConstraints.expand(height: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
