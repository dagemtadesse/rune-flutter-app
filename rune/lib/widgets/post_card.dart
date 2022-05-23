import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rune/models/models.dart';
import 'package:rune/models/providers/provider.dart';
import 'package:rune/widgets/widgets.dart';

class PostCard extends StatelessWidget {
  final Post post;
  const PostCard({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Color.fromRGBO(206, 206, 206, 1),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12.0),
        // bo
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: AuthorHeader(date: post.createdAt, author: post.author),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                post.title,
                style: GoogleFonts.poppins(
                    fontSize: 17.0, fontWeight: FontWeight.w500),
              ),
            ),
            if (post.mediaUrl != null)
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Center(
                  child: Image.network(Repository.resBaseUrl + post.mediaUrl!),
                ),
              ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 40.0, top: 8.0, bottom: 16.0),
              child: Text(
                post.text,
                style: GoogleFonts.poppins(fontSize: 16),
              ),
            ),
            ReactButtons(post: post),
          ],
        ),
      ),
    );
  }
}
