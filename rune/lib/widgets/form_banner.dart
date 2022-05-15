import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormBanner extends StatelessWidget {
  final String header;
  final String description;

  const FormBanner({Key? key, required this.header, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: GoogleFonts.poppins(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.black54,
          ),
        )
      ],
    );
  }
}
