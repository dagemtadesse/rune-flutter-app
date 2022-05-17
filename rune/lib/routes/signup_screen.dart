import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rune/models/network/network_states.dart';
import 'package:rune/models/providers/provider.dart';
import 'package:rune/theme.dart';
import 'package:rune/widgets/widgets.dart';

import '../models/network/user_requests.dart';

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
            Consumer<RegistrationFromModel>(
                builder: (context, formProvider, _) {
              return Expanded(
                child: Column(
                  children: [
                    ValidateInput(
                      placeholder: 'Full name',
                      setter: (String value) => formProvider.fullName = value,
                      validationMsg: formProvider.fullNameValidation,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ValidateInput(
                      placeholder: 'Email',
                      setter: (String value) => formProvider.email = value,
                      validationMsg: formProvider.emailValidation,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ValidateInput(
                      placeholder: 'Password',
                      setter: (String value) => formProvider.password = value,
                      validationMsg: formProvider.passwordValidation,
                      toggler: formProvider.togglePasswordVisibility,
                      hidePassword: formProvider.hidePassword,
                      showIcon: true,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ValidateInput(
                      placeholder: 'Confirm Password',
                      setter: (String value) => formProvider.cPassword = value,
                      validationMsg: formProvider.cPasswordValidation,
                      hidePassword: true,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    NetworkProgress(
                      state: formProvider.signInRequestState,
                    ),
                  ],
                ),
              );
            }),
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
                  onPressed: () async {
                    final provider = Provider.of<RegistrationFromModel>(context,
                        listen: false);
                    // print(provider.password);
                    if (provider.validateEmail() &&
                        provider.validatePassword() &&
                        provider.validateCPassword()) {
                      provider.setSignInRequestState(Sent());
                      try {
                        final data = await UserRequest.register(
                            provider.fullName,
                            provider.email,
                            provider.password);
                        provider.setSignInRequestState(Received(data));
                      } catch (error) {
                        provider.setSignInRequestState(Failure(error));
                      }
                    }
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
