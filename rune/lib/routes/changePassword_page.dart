import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Stack(alignment: Alignment.centerLeft, children: <Widget>[
            Image(
              width: 332,
              height: 205,
              image: AssetImage("assets/Vector.png"),
            ),
            Padding(
              padding: EdgeInsets.only(left: 36),
              child: Text(
                "Change \nPassword",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700),
              ),
            ),
          ]),
          Container(
            padding: EdgeInsets.only(left: 16, right: 16, top: 30),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Old-Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'New-Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.visibility),
                hintText: 'Confirm New- Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          SizedBox(height: 246),
          Container(
            width: 343,
            height: 46,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Change Password"),
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(18, 18, 18, 1.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
