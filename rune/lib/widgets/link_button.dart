import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionTextButton extends StatelessWidget {
  final String question;
  final String link;
  final void Function() callback;

  const QuestionTextButton(
      {Key? key,
      required this.question,
      required this.link,
      required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            question,
            style: GoogleFonts.poppins(fontSize: 14),
          ),
          const SizedBox(width: 3),
          Text(
            link,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
