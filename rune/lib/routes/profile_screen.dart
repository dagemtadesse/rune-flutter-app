import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rune/models/providers/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageModel = Provider.of<PageModel>(context, listen: false);
    return Column(
      children: [
        SizedBox(
          height: 192,
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color.fromRGBO(15, 36, 39, 1),
                  Color.fromRGBO(32, 56, 67, 1),
                  Color.fromRGBO(43, 83, 100, 1),
                ])),
                height: 154,
              ),
              const Positioned(
                top: 100,
                left: 18,
                child: CircleAvatar(
                  radius: 46,
                  backgroundImage: AssetImage("assets/test.jpg"),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              Text(
                "Flash Thompson",
                style: GoogleFonts.poppins(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              Text(
                "@flash_thomspon",
                style: GoogleFonts.poppins(fontSize: 15),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                        leading: const Icon(Icons.edit_outlined),
                        title: const Text("Edit Profile"),
                        onTap: () {
                          pageModel.setCurrentPage(Pages.editProfilePage);
                        }),
                    const ListTile(
                        leading: Icon(Icons.bookmarks_outlined),
                        title: Text("Bookmarks")),
                    const ListTile(
                        leading: Icon(Icons.image_outlined),
                        title: Text("Posts")),
                    const ListTile(
                        leading: Icon(Icons.chat_bubble_outline),
                        title: Text("Comments")),
                    const ListTile(
                      leading: Icon(Icons.logout),
                      title: Text("Logout"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
