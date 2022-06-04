import 'package:flutter/material.dart';




class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      elevation: 0.5,
      items: const [
        BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/icons/home_icon.png")), label: "Home"),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/icons/channels_icon.png")), label: "Channels"),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/icons/profile_icon.png")), label: "Profile"),
      ],
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      selectedItemColor: Color.fromARGB(255, 9, 9, 9)
    );
  }
}