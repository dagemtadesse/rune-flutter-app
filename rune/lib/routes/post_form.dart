import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rune/theme.dart';

import '../bloc/bloc.dart';

class PostForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final postTitle = TextEditingController();
  final postDescription = TextEditingController();
  XFile? selectedImage;

  PostForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uploadPostBloc =
        BlocProvider.of<UploadPostBloc>(context, listen: false);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    style: TextButton.styleFrom(primary: RuneTheme.borderColor),
                    onPressed: (() =>
                        uploadPostBloc.add(CancelUploadPostEvent())),
                    child: Text(
                      "Cancel",
                      style: GoogleFonts.poppins(
                          fontSize: 15.0, fontWeight: FontWeight.w400),
                    )),
                BlocConsumer<UploadPostBloc, UploadPostState>(
                  listener: (context, state) {
                    if (state == UploadPostState.donePostUploadState) {
                      Navigator.pop(context);
                    }
                    if (state == UploadPostState.errorPostUploadState) {
                      var snackBar = const SnackBar(
                          content: Text("Unable to upload your post"));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  builder: (_, state) => TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor:
                          state == UploadPostState.sentPostUploadState
                              ? Colors.grey
                              : Colors.black,
                    ),
                    onPressed: state == UploadPostState.sentPostUploadState
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              final title = postTitle.text;
                              final content = postDescription.text;
                              uploadPostBloc.add(
                                SendUploadPostEvent(30, title, content),
                              );
                            }
                          },
                    child: state == UploadPostState.sentPostUploadState
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ))
                        : Text(
                            "Post",
                            style: GoogleFonts.poppins(
                                fontSize: 15.0, fontWeight: FontWeight.w300),
                          ),
                  ),
                )
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
                        onPressed: () async {
                          var file = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          print(file!.path);
                        },
                        icon: const Icon(Icons.image_outlined,
                            color: Color.fromRGBO(18, 18, 18, 1)),
                      ),
                    ]),
                  ],
                ),
                const SizedBox(height: 12.0),
                TextFormField(
                  controller: postTitle,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: const Color.fromARGB(255, 99, 99, 99),
                  ),
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: "Post Title...",
                  ),
                  showCursor: true,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  controller: postDescription,
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
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
