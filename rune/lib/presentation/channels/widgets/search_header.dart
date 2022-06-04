import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rune/theme.dart';

import 'search_bar.dart';

class SearchHeader extends StatelessWidget {
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
          SearchBar(),
          const SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Trending",
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: RuneTheme.borderColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
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
}
