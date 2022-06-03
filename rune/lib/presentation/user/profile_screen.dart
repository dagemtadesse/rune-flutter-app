import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rune/application/blocs.dart';
import 'package:rune/domain/page_model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navCubit = context.read<NavigationCubit>();

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
              BlocBuilder<NavigationCubit, NavigationState>(
                buildWhen: (_, state) => state is DashboardRoute,
                builder: (context, state) {
                  final user = (state as DashboardRoute).loggedInUser;
                  return Positioned(
                    top: 100,
                    left: 18,
                    child: CircleAvatar(
                      radius: 46,
                      backgroundImage: (user.avatar == null
                          ? const AssetImage("assets/test.jpg")
                          : NetworkImage(user.avatar!)) as ImageProvider,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<NavigationCubit, NavigationState>(
                buildWhen: (_, state) => state is DashboardRoute,
                builder: (context, state) {
                  final user = (state as DashboardRoute).loggedInUser;

                  return Column(
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
                          user.handle!,
                          style: GoogleFonts.poppins(fontSize: 15),
                        )
                    ],
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                        leading: const Icon(Icons.edit_outlined),
                        title: const Text("Edit Profile"),
                        onTap: () => navCubit.toEditProfile()),
                    ListTile(
                        leading: const Icon(Icons.lock_outline),
                        title: const Text("Change Password"),
                        onTap: () => navCubit.toChangePasswordScreen()),
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
                    ListTile(
                      leading: const Icon(Icons.logout),
                      title: const Text("Logout"),
                      onTap: () => navCubit.toSplashScreen(),
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
