import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/models.dart';
import '../models/providers/provider.dart';

import 'package:timeago/timeago.dart' as timeAgo;

class AuthorHeader extends StatelessWidget {
  final DateTime date;
  final User author;

  const AuthorHeader({Key? key, required this.date, required this.author})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (author.avatar != null)
          CircleAvatar(
            radius: 24,
            backgroundImage:
                NetworkImage(Repository.resBaseUrl + author.avatar!),
          ),
        if (author.avatar == null)
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
              author.fullName,
              style: GoogleFonts.poppins(
                  color: const Color.fromRGBO(18, 18, 18, 1),
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
            Text(timeAgo.format(date), style: GoogleFonts.poppins(fontSize: 14))
          ],
        )
      ],
    );
  }
}
