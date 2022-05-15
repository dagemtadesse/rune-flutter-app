import 'package:flutter/material.dart';
import 'package:rune/theme.dart';
import 'package:rune/widgets/widgets.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              header: 'Create an account',
              description:
                  'Welcome to Rune, a platform where everyone has a voice.',
            ),
            const SizedBox(
              height: 48,
            ),
            Expanded(
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Full name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      suffixIcon: const Icon(Icons.visibility),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Already have an account? '),
                Text(
                  'Sign in',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                ExpandableButton(
                  text: 'Register',
                  onPressed: () {},
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
