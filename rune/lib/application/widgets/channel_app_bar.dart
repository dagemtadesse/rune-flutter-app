import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChannelAppBar extends StatelessWidget {
  final String description;
  final String channelName;

  const ChannelAppBar(
      {Key? key, required this.description, required this.channelName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          constraints:
              const BoxConstraints.expand(height: 260, width: double.infinity),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/mechanical.jpg"), fit: BoxFit.cover),
          ),
        ),
        /////
        Container(
          constraints: const BoxConstraints.expand(
            height: 260,
            width: double.infinity,
          ),
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.bookmark_add_outlined),
                    color: Colors.white,
                  ),
                  const SizedBox(width: 18),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Text(
                        "Mechanical Engineering",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Text(
                        description,
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 15.0),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                        ),
                      ),
                      constraints: const BoxConstraints.expand(height: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
