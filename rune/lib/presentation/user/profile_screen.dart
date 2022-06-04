import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rune/application/blocs.dart';
import 'package:rune/infrastructure/repositories.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navCubit = context.read<NavigationCubit>();
    final user = context.read<UserRepository>().loggedInUser;

    return Scaffold(
      body: Column(
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
                Positioned(
                  top: 100,
                  left: 18,
                  child: CircleAvatar(
                    radius: 46,
                    backgroundImage: (user.avatar == null
                        ? const AssetImage("assets/test.jpg")
                        : NetworkImage(user.avatar!)) as ImageProvider,
                  ),
                )
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
                  user.fullName,
                  style: GoogleFonts.poppins(
                      fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                if (user.handle != null)
                  Text(
                    '@${user.handle ?? ""}',
                    style: GoogleFonts.poppins(fontSize: 15),
                  ),
                SizedBox(height: 16),
                ListTile(
                    leading: const Icon(Icons.edit_outlined),
                    title: const Text("Edit Profile"),
                    onTap: () => navCubit.toEditProfile(user)),
                ListTile(
                    leading: const Icon(Icons.lock_outline),
                    title: const Text("Change Password"),
                    onTap: () => navCubit.toChangePasswordScreen(user)),
                ListTile(
                    leading: const Icon(Icons.bookmarks_outlined),
                    title: const Text("Bookmarks"),
                    onTap: () => navCubit.toBookmarksScreen()),
                ListTile(
                    leading: const Icon(Icons.image_outlined),
                    title: const Text("Posts"),
                    onTap: () => navCubit.toPostsScreen()),
                ListTile(
                    leading: const Icon(Icons.chat_bubble_outline),
                    title: const Text("Comments"),
                    onTap: () => navCubit.toCommentsScreen()),
                if (user.role == 'ADMIN')
                  ListTile(
                    leading: const Icon(Icons.create_new_folder_outlined),
                    title: const Text("Create Channel"),
                    onTap: () => navCubit.toCreateChannelScreen(),
                  ),
                if (user.role == 'USER')
                  ListTile(
                    leading: const Icon(Icons.add_moderator_outlined),
                    title: const Text("Request to become admin"),
                    onTap: () => navCubit.toSplashScreen(),
                  ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text("Logout"),
                  onTap: () => navCubit.toSplashScreen(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
