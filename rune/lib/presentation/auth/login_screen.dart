import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rune/application/blocs.dart';

import 'package:rune/application/widgets/form_banner.dart';
import 'package:rune/application/widgets/link_button.dart';
import 'package:rune/domain/page_model.dart';
import 'package:rune/domain/user/user_form_validator.dart';
import 'package:rune/infrastructure/repositories.dart';

import 'package:rune/presentation/auth/widgets/widgets.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authBloc = AuthBloc(userRepository: context.read<UserRepository>());
    return BlocProvider(
      create: (context) => authBloc,
      child: Scaffold(
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
          child: Form(
            key: _formKey,
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
                Expanded(
                  child: Column(
                    children: [
                      AuthInput(
                        controller: emailController,
                        hintText: 'Email',
                        validator: UserFormValidator.validateEmail,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      PasswordInput(
                          controller: passwordController,
                          textHint: 'Password',
                          validator: UserFormValidator.validatePassword),
                    ],
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
                AuthButton(
                    label: "Sign In",
                    dispatcher: () {
                      authBloc.add(
                        LoginRequest(
                          emailController.text,
                          passwordController.text,
                        ),
                      );
                    },
                    formKey: _formKey)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
