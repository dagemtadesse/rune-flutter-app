import 'package:flutter/material.dart';
import 'package:rune/presentation/channels/bookmarks_screen.dart';
import 'package:rune/presentation/screens.dart';

class HostPage extends StatefulWidget {
  final int defaultIndex;

  const HostPage(
    this.defaultIndex, {
    Key? key,
  }) : super(key: key);

  @override
  State<HostPage> createState() => _HostPageState();
}

class _HostPageState extends State<HostPage> {
  late int myIndex;

  final myPages = [
    const BookmarksScreen(),
    const ChannelPage(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    myIndex = widget.defaultIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myPages[myIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: myIndex,
          onTap: (int index) {
            setState(() {
              myIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmarks_outlined),
              label: "Bookmarks",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: "Profile",
            ),
          ]),
    );
  }
}
