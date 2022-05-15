import 'package:flutter/material.dart';

class Profile2 extends StatefulWidget {
  const Profile2({Key? key}) : super(key: key);

  @override
  State<Profile2> createState() => _Profile2State();
}

class _Profile2State extends State<Profile2> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.blue,
          constraints: BoxConstraints.expand(height: 200),
        ),
        Positioned(
          top: 100,
          left: 10,
          child: CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage("assets/test.jpg"),
          ),
        ),
        Positioned(
            top: 270,
            left: 10,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Flash Thompson",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "flash_thomspon",
                    style: TextStyle(fontSize: 18),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.edit_outlined)),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text("Edit Profile")
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.bookmarks_outlined)),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text("Bookmarks")
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.image_outlined)),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text("Posts")
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.chat_bubble_outline)),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text("Comments")
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.donut_large_rounded)),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text("Channels")
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.logout)),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text("Logout")
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ))
      ],
    );
  }
}
