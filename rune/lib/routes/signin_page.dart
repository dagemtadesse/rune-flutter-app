import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rune/models/providers/provider.dart';
import '../theme.dart';
import '../widgets/widgets.dart';
import 'signup_page.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
        child: Column(
          children: [
            const FormBanner(
              header: "Let's Sign you in.",
              description:
                  'Welcome to Rune, a platform where everyone has a voice.',
            ),
            const SizedBox(
              height: 48,
            ),
            Consumer<LoginFormModel>(
              builder: (context, formProvider, _) => Expanded(
                child: Column(
                  children: [
                    ValidateInput(
                      placeholder: 'Email',
                      setter: (String value) => formProvider.email = value,
                      validationMsg: formProvider.emailValidation,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ValidateInput(
                      placeholder: 'password',
                      setter: (String value) => formProvider.password = value,
                      toggler: formProvider.togglePasswordVisibility,
                      hidePassword: formProvider.hidePassword,
                      validationMsg: formProvider.passwordValidation,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Don't have an account? "),
                Text(
                  'Register',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                ExpandableButton(
                  text: 'Sign In',
                  onPressed: () {
                    final provider =
                        Provider.of<LoginFormModel>(context, listen: false);
                    provider.validateEmail();
                    provider.validatePassword();
                  },
                  theme: SplashTheme.buttonTheme,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

/*
appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
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
                  onTap: () {},
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
 */