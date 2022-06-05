import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rune/domain/post/post_validator.dart';

class PostInput extends StatelessWidget {
  const PostInput({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // keyboardType: TextInputT
      controller: controller,
      validator: PostValidator.validateTitle,
      style: GoogleFonts.poppins(
        fontSize: 15,
        color: const Color.fromARGB(255, 99, 99, 99),
      ),
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        hintText: hintText,
      ),
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.done,
      showCursor: true,
    );
  }
}
