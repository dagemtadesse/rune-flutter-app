import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UnderlinedInput extends StatelessWidget {
  final String label;
  final String hint;

  const UnderlinedInput({Key? key, required this.label, required this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          // errorText: "Invalid error",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          // contentPadding: EdgeInsets.all(18),
          isDense: false,
          hintStyle: GoogleFonts.poppins(
            fontSize: 14,
            color: const Color.fromARGB(255, 99, 99, 99),
          ),
          border: const UnderlineInputBorder(),
          labelText: label,
          hintText: hint),
    );
  }
}
