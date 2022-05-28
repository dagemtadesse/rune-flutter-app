import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rune/application/widgets/expandable_button.dart';
import 'package:rune/application/widgets/form_banner.dart';
import 'package:rune/application/widgets/link_button.dart';
import 'package:rune/application/widgets/network_progress.dart';
import 'package:rune/application/widgets/validated_inputs.dart';
import 'package:rune/domain/auth/register_form.dart';
import 'package:rune/domain/page_model.dart';
import 'package:rune/infrastructure/network_states.dart';
import 'package:rune/infrastructure/user/user_api_provider.dart';
import 'package:rune/theme.dart';

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
            QuestionTextButton(
                question: "Don't have an account?",
                link: 'Register',
                callback: (context) {
                  final pageModel =
                      Provider.of<PageModel>(context, listen: false);
                  pageModel.setCurrentPage(Pages.signInPage);
                }),
            const SizedBox(height: 10),
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
                        final data = await UserAPIProvider.register(
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
