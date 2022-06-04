import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CenteredMessage extends StatelessWidget {
  final Widget child;
  final bool sad;
  const CenteredMessage({Key? key, required this.child, this.sad = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 72),
      child: Center(
          child: Column(
        children: [
          child,
          const SizedBox(
            height: 16,
          ),
          if (sad)
            Text(
              "('_')",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 18,
              ),
            ),
        ],
      )),
    );
  }
}
