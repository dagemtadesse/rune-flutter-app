import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rune/application/post/bloc/post_bloc.dart';
import 'package:rune/infrastructure/repositories.dart';
import 'package:rune/presentation/post/widgets/post_input.dart';
import 'package:rune/theme.dart';

import 'widgets/card_info.dart';

class PostForm extends StatelessWidget {
  PostForm({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = context.read<UserRepository>().loggedInUser;
    final uploadPostBloc = context.read<PostBloc>();

    return Builder(builder: (context) {
      return Container(
        margin: EdgeInsets.only(
            left: 18.0,
            right: 18.0,
            top: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      style:
                          TextButton.styleFrom(primary: RuneTheme.borderColor),
                      onPressed: (() => uploadPostBloc.add(CancelUploadPost())),
                      child: Text(
                        "Cancel",
                        style: GoogleFonts.poppins(
                            fontSize: 15.0, fontWeight: FontWeight.w400),
                      )),
                  BlocConsumer<PostBloc, PostState>(
                    listener: (context, state) {
                      if (state is UploadingPostSucced ||
                          state is UploadingPostCancled) {
                        Navigator.pop(context);
                      }
                      if (state == UploadingPostFailed) {
                        var snackBar = const SnackBar(
                            content: Text("Unable to upload your post"));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.pop(context);
                      }
                    },
                    builder: (_, state) => TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.black,
                      ),
                      onPressed: state == UploadingPost
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                final title = titleController.text;
                                final content = contentController.text;
                                uploadPostBloc.add(
                                  UploadPost(30, title, content),
                                );
                              }
                            },
                      child: state == UploadingPost
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
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Divider(
                color: RuneTheme.borderColor,
                thickness: 1.0,
              ),
              const SizedBox(height: 8),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CardDetails(user: user),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.image_outlined,
                                    color: Color.fromRGBO(18, 18, 18, 1)),
                              ),
                            ]),
                      ],
                    ),
                    const SizedBox(height: 12.0),
                    PostInput(
                        hintText: "Post description...",
                        controller: titleController),
                    const SizedBox(
                      height: 8.0,
                    ),
                    PostInput(
                        hintText: "Post Titie...",
                        controller: contentController),
                    const SizedBox(
                      height: 8.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
