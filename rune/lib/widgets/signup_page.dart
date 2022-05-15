import 'package:flutter/material.dart';
import 'package:rune/widgets/signin_page.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
          Stack(
            alignment: Alignment.centerLeft,
            children: <Widget>[
              Image(
                width: 332,
                height: 205,
                image: AssetImage("assets/Vector.png"),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  "Create Account",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 27,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 16, right: 16, top: 30),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Full name',
                border: OutlineInputBorder(),
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
                hintText: 'Email',
                border: OutlineInputBorder(),
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
                hintText: 'Password',
                border: OutlineInputBorder(),
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
                hintText: 'Confirm Password',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 149),
          Container(
            padding: EdgeInsets.only(left: 79, right: 102, bottom: 16),
            child: Row(
              children: [
                Text("Already have an account?"),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => (SignIn())));
                  },
                  child: Text(
                    "Login",
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
              child: Text("Sign Up"),
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
