import 'package:flutter/material.dart';
import 'signup_page.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(
          229,
          229,
          229,
          1.0,
        ),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Stack(alignment: Alignment.centerLeft, children: <Widget>[
            Image(
              width: 332,
              height: 205,
              image: AssetImage("assets/Vector.png"),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                "Let's Sign You In.",
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
                hintText: 'Phone and Email',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Container(
            padding: EdgeInsets.only(left: 16, right: 16, top: 30),
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.visibility),
                hintText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 250),
          Container(
            padding: EdgeInsets.only(left: 79, right: 102, bottom: 16),
            child: Row(
              children: [
                Text("Don't have an account?"),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => (SignUp())));
                  },
                  child: Text(
                    "Register",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 343,
            height: 46,
            child: ElevatedButton(
                onPressed: () {},
                child: Text("Sign In"),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(18, 18, 18, 1.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                )),
          ),
        ],
      )),
    );
  }
}
