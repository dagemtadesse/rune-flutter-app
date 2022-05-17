import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme.dart';

class ReactButtons extends StatelessWidget {
  const ReactButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.upload),
                      color: RuneTheme.borderColor),
                  Text("125", style: GoogleFonts.poppins()),
                  const SizedBox(
                    width: 20.0,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.download,
                          color: RuneTheme.borderColor)),
                  Text("56", style: GoogleFonts.poppins())
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon:
                const Icon(Icons.comment_rounded, color: RuneTheme.borderColor),
          ),
        ],
      ),
    );
  }
}
