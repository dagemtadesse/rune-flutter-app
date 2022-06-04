import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UnderlinedInput extends StatelessWidget {
  final String label;

  final TextEditingController controller;
  final String? Function(String?) validator;

  const UnderlinedInput(
      {Key? key,
      required this.label,
      required this.controller,
      required this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
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
      ),
    );
  }
}
