import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rune/theme.dart';

import '../../../application/widgets/widgets.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                const Icon(Icons.save, color: RuneTheme.borderColor),
                const SizedBox(width: 4),
                Text("Save",
                    style: GoogleFonts.poppins(color: RuneTheme.borderColor))
              ],
            ),
          ),
          const SizedBox(width: 18)
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: const AssetImage("assets/pp.jpg"),
              radius: 46.0,
              child: IconButton(
                iconSize: 40.84,
                icon: const Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
            ),
            const SizedBox(
              height: 36,
            ),
            const UnderlinedInput(label: 'Full name', hint: 'Flash Thompson'),
            const SizedBox(
              height: 18,
            ),
            const UnderlinedInput(label: 'Username', hint: "flashy_thompson"),
            const SizedBox(
              height: 18,
            ),
            const UnderlinedInput(
                label: 'Email', hint: "flashy_thompson@mail.com")
          ],
        ),
      ),
    );
  }
}
