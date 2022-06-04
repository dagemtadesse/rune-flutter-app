import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rune/application/auth/bloc/auth_bloc.dart';
import 'package:rune/application/widgets/widgets.dart';
import 'package:rune/domain/user/user_form_validator.dart';
import 'package:rune/infrastructure/network_states.dart';
import 'package:rune/infrastructure/repositories.dart';
import 'package:rune/presentation/auth/widgets/widgets.dart';
import 'package:rune/theme.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final oldPasswordController= TextEditingController();
  final newPasswordController= TextEditingController();
  final confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authBloc = AuthBloc(userRepository: context.read<UserRepository>());
    return BlocProvider(
      create: (context) => authBloc,
      child: Scaffold(
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
                const FormBanner(
                  header: "Change Your password",
                  description: '',
                ),
                const SizedBox(
                  height: 48,
                ),
                Expanded(
                    child: Column(children: [
                  PasswordInput(
                      textHint: 'Old Password',
                      controller: oldPasswordController,
                      validator: UserFormValidator.validatePassword),
                ])),
                const SizedBox(
                  height: 16,
                ),
                PasswordInput(
                  textHint: 'New Password',
                  controller: newPasswordController,
                  validator: UserFormValidator.validatePassword,
                ),
                const SizedBox(
                  height: 16,
                ),
                PasswordInput(
                  textHint: 'Confirm New Password',
                  validator: UserFormValidator.validatePassword,
                  controller: confirmPasswordController,
                ),
                const SizedBox(
                  height: 16,
                ),
                const SizedBox(height: 32),
                AuthButton(
                  label: 'Change Password',
                  dispatcher: () {
                    authBloc.add(
                      ChangePasswordRequest(
                        oldPasswordController.text,
                        newPasswordController.text,
                        
                      ),
                    );
                  },
                  formKey: _formKey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
