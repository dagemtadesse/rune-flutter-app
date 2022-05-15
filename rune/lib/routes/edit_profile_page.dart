import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  Color.fromRGBO(97, 67, 133, 1.0),
                  Color.fromRGBO(23, 0, 118, 1.0)
                ]),
          ),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.save,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              Text(
                "Save",
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: 20,
              )
            ],
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 21, top: 29),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/pp.jpg"),
              radius: 50.0,
              child: IconButton(
                iconSize: 40.84,
                icon: Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Full name',
                  hintText: "Falsh Thompson"),
            ),
            SizedBox(
              height: 32,
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'username',
                hintText: "flashytom",
              ),
            ),
            SizedBox(
              height: 32,
            ),
            TextFormField(
              //initialValue:"flashtomson@yourmoms.com" ,
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Email',
                  hintText: "flashtomson@yourmoms.com"),
            ),
          ],
        ),
      ),
    );
  }
}
