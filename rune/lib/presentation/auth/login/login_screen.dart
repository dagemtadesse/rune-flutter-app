import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rune/application/widgets/expandable_button.dart';
import 'package:rune/application/widgets/form_banner.dart';
import 'package:rune/application/widgets/link_button.dart';
import 'package:rune/application/widgets/network_progress.dart';
import 'package:rune/application/widgets/validated_inputs.dart';
import 'package:rune/domain/authentication/login_form.dart';
import 'package:rune/domain/page_model.dart';
import 'package:rune/infrastructure/network_states.dart';
import 'package:rune/infrastructure/user/user_api_provider.dart';
import 'package:rune/theme.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
                      placeholder: 'Password',
                      setter: (String value) => formProvider.password = value,
                      toggler: formProvider.togglePasswordVisibility,
                      hidePassword: formProvider.hidePassword,
                      showIcon: true,
                      validationMsg: formProvider.passwordValidation,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    NetworkProgress(
                      state: formProvider.loginRequestState,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            QuestionTextButton(
                question: "Forgot password?",
                link: 'Change password',
                callback: (context) {
                  final pageModel =
                      Provider.of<PageModel>(context, listen: false);
                  pageModel.setCurrentPage(Pages.changePasswordPage);
                }),
            const SizedBox(height: 10),
            Row(
              children: [
                ExpandableButton(
                  text: 'Sign In',
                  onPressed: () async {
                    final provider =
                        Provider.of<LoginFormModel>(context, listen: false);
                    if (provider.validateEmail() &&
                        provider.validatePassword()) {
                      provider.setLoginRequestState(Sent());
                      try {
                        final data = await UserRequest.login(
                            provider.email, provider.password);
                        provider.setLoginRequestState(Received(data));
                      } catch (error) {
                        provider.setLoginRequestState(Failure(error));
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
