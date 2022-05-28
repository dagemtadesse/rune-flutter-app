import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rune/Application/widgets/widgets.dart';
import 'package:rune/Domain/post/post_models/post.dart';

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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                        post.publisher.fullName,
                        style: GoogleFonts.poppins(
                            color: const Color.fromRGBO(18, 18, 18, 1),
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(post.datePublished.toString(),
                          style: GoogleFonts.poppins(fontSize: 14))
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                post.postTitle,
                style: GoogleFonts.poppins(
                    fontSize: 17.0, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            if (post.postImage != null)
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
                  const EdgeInsets.only(left: 40.0, top: 8.0, bottom: 16.0),
              child: Text(
                post.postContent,
                style: GoogleFonts.poppins(fontSize: 16),
              ),
            ),
            const ReactButtons(),
          ],
        ),
      ),
    );
  }
}
