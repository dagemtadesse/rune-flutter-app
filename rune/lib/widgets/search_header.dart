import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rune/models/providers/provider.dart';

import '../theme.dart';
import 'widgets.dart';

class SearchHeader<T> extends StatelessWidget {
  const SearchHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
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
              Consumer<PageModel>(
                builder: (context, pageModel, child) => Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        pageModel.setChannelTab(ChannelTab.trending);
                      },
                      child: Text(
                        "Trending",
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: RuneTheme.borderColor,
                          fontWeight:
                              (pageModel.channelTab == ChannelTab.trending)
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    TextButton(
                      onPressed: () {
                        pageModel.setChannelTab(ChannelTab.pinned);
                        print(pageModel.channelTab);
                      },
                      child: Text(
                        "Pinned",
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: RuneTheme.borderColor,
                          fontWeight:
                              (pageModel.channelTab == ChannelTab.pinned)
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              IconButton(
                  onPressed: () {
                    Provider.of<PageModel>(
                      context,
                      listen: false,
                    ).toggleOrdering();
                  },
                  icon: const Icon(Icons.sort_rounded,
                      color: RuneTheme.borderColor))
            ],
          )
        ],
      ),
    );
  }
}
