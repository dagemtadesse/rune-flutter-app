import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rune/application/blocs.dart';
import 'package:rune/domain/user/user_form_validator.dart';

import 'widgets/widgets.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final fullNameController = TextEditingController();
  final passwordController = TextEditingController();
  final cPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
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
        child: Form(
          key: _formKey,
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
                    AuthInput(
                        controller: fullNameController,
                        hintText: 'Full name',
                        validator: UserFormValidator.validateFullName),
                    const SizedBox(
                      height: 16,
                    ),
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
                    const SizedBox(
                      height: 16,
                    ),
                    PasswordInput(
                        controller: cPasswordController,
                        textHint: 'Confirm Password',
                        validator: (value) =>
                            UserFormValidator.validateConfirmPassword(
                                value, passwordController)),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              const SizedBox(height: 10),
              AuthButton(
                  label: "Register",
                  dispatcher: () {
                    authBloc.add(
                      SignUpRequest(
                        fullNameController.text,
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
