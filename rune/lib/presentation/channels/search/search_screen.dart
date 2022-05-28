import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rune/Application/widgets/channel_card.dart';
import 'package:rune/Application/widgets/search_bar.dart';
import 'package:rune/theme.dart';

class ChannelPage extends StatelessWidget {
  const ChannelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: 20,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      "Channels",
                      style: GoogleFonts.poppins(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    const SearchBar(),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Trending",
                              style: GoogleFonts.poppins(
                                  fontSize: 15, color: RuneTheme.borderColor),
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            Text(
                              "Subscribed",
                              style: GoogleFonts.poppins(
                                  fontSize: 15, color: RuneTheme.borderColor),
                            )
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.sort_rounded,
                                color: RuneTheme.borderColor))
                      ],
                    )
                  ],
                ),
              );
            }
            return const ChannelCard();
          }),
      backgroundColor: Colors.white,
    );
  }
}
