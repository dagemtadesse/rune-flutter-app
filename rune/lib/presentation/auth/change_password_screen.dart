import 'package:flutter/material.dart';
import 'package:rune/application/auth/bloc/auth_bloc.dart';
import 'package:rune/application/widgets/widgets.dart';
import 'package:rune/domain/user/user_form_validator.dart';
import 'package:rune/infrastructure/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/user/user_model.dart';
import 'widgets/widgets.dart';

class ChangePasswordScreen extends StatelessWidget {
  final User currentUser;

  ChangePasswordScreen({Key? key, required this.currentUser}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final oldPwdController = TextEditingController();
  final newPwdController = TextEditingController();
  final confirmNewPwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FormBanner(
                      header: "Change Your password",
                      description: '',
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    PasswordInput(
                      controller: oldPwdController,
                      textHint: 'Old Password',
                      validator: UserFormValidator.validatePassword,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    PasswordInput(
                      controller: newPwdController,
                      textHint: 'New Password',
                      validator: UserFormValidator.validatePassword,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    PasswordInput(
                      allowPeek: false,
                      controller: confirmNewPwdController,
                      textHint: 'Confirm New Password',
                      validator: (value) =>
                          UserFormValidator.validateConfirmPassword(
                              value, newPwdController),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              AuthButton(
                  label: "Change Password",
                  dispatcher: () {
                    authBloc.add(
                      ChangePasswordRequest(oldPwdController.text,
                          newPwdController.text, currentUser.email),
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
