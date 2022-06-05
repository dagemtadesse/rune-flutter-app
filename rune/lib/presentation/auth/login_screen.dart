import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rune/application/blocs.dart';
import 'package:rune/domain/user/user_form_validator.dart';
import 'package:rune/presentation/auth/widgets/widgets.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
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
                      height: 12,
                    ),
                    PasswordInput(
                        controller: passwordController,
                        textHint: 'Password',
                        validator: UserFormValidator.validatePassword),
                    const SizedBox(
                      height: 12,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 32),
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
    );
  }
}
