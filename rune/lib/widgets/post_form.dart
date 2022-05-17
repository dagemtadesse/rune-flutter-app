import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rune/theme.dart';

class PostForm extends StatelessWidget {
  const PostForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  style: TextButton.styleFrom(primary: RuneTheme.borderColor),
                  onPressed: (() => Navigator.of(context).pop()),
                  child: Text(
                    "Cancel",
                    style: GoogleFonts.poppins(
                        fontSize: 15.0, fontWeight: FontWeight.w400),
                  )),
              TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () {},
                  child: Text(
                    "Post",
                    style: GoogleFonts.poppins(
                        fontSize: 15.0, fontWeight: FontWeight.w300),
                  )),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(
            color: RuneTheme.borderColor,
            thickness: 1.0,
          ),
          const SizedBox(height: 8),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
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
                            "Publisher Name",
                            style: GoogleFonts.poppins(
                                color: const Color.fromRGBO(18, 18, 18, 1),
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(DateTime.now().toString(),
                              style: GoogleFonts.poppins(fontSize: 14))
                        ],
                      ),
                    ],
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.image_outlined,
                          color: Color.fromRGBO(18, 18, 18, 1)),
                    ),
                  ]),
                ],
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: const Color.fromARGB(255, 99, 99, 99),
                ),
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: "Post Title...",
                ),
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.done,
                showCursor: true,
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextFormField(
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: const Color.fromARGB(255, 99, 99, 99),
                ),
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: "Post description...",
                ),
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.done,
                showCursor: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
