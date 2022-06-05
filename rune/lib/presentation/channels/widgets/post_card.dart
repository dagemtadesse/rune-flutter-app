import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rune/domain/post/post_model.dart';
import 'package:rune/presentation/post/widgets/card_info.dart';

import 'reactions.dart';

class PostCard extends StatelessWidget {
  final Post post;
  const PostCard({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
      shape: RoundedRectangleBorder(
        side:
            const BorderSide(color: Color.fromRGBO(206, 206, 206, 1), width: 1),
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
                child: CardDetails(
                  user: post.author,
                )),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                post.title,
                style: GoogleFonts.poppins(
                    fontSize: 17.0, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            if (post.image != null)
              Container(
                constraints: const BoxConstraints.expand(
                    height: 180, width: double.infinity),
                child: const Image(
                  image: AssetImage("assets/test.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 15.0, top: 8.0, bottom: 16.0),
              child: Text(
                post.content,
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
