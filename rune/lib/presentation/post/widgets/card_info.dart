import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rune/domain/models.dart';

class CardDetails extends StatelessWidget {
  final User user;
  const CardDetails({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage("assets/test.jpg"),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.fullName,
              style: GoogleFonts.poppins(
                  color: const Color.fromRGBO(18, 18, 18, 1),
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
            Text(DateTime.now().toString().substring(0, 16),
                style: GoogleFonts.poppins(fontSize: 14))
          ],
        ),
      ],
    );
  }
}
