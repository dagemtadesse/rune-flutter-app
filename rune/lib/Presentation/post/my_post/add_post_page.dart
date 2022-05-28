import 'package:flutter/material.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({Key? key}) : super(key: key);

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Row(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.attach_file)),
                  SizedBox(
                    width: 20.0,
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.send))
                ],
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "What do you want to share?",
                ),
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.done,
                showCursor: true,
              ),
            ),
          ],
        ));
  }
}
