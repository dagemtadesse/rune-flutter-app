import 'package:flutter/material.dart';
import './routes.dart';

class HostPage extends StatefulWidget {
  const HostPage({Key? key}) : super(key: key);

  @override
  State<HostPage> createState() => _HostPageState();
}

class _HostPageState extends State<HostPage> {
  int myIndex = 1;
  final myPages = [
    // const HomePage(),
    const ChannelPage(),
    const Profile2(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                // SliverAppBar(
                //   title: Text("Home"),
                //   centerTitle: true,
                //   backgroundColor: Colors.blue,
                // ),
              ],
          body: myPages[myIndex]),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: myIndex,
          onTap: (int index) {
            setState(() {
              myIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.groups_sharp), label: "Channel"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: "Profile"),
          ]),
    );
  }
}
