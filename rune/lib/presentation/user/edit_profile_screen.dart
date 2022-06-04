import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rune/application/blocs.dart';
import 'package:rune/application/user/bloc/user_bloc.dart';
import 'package:rune/domain/user/user_form_validator.dart';
import 'package:rune/infrastructure/repositories.dart';
import 'widgets/underlined_input.dart';
import 'package:rune/theme.dart';
import 'dart:developer' as developer;

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userRepository = context.read<UserRepository>();
    final navCubit = context.read<NavigationCubit>();
    final user = userRepository.loggedInUser;

    final _formKey = GlobalKey<FormState>();
    final fullNameController = TextEditingController(text: user.fullName);
    final userNameController = TextEditingController(text: user.handle);
    final emailController = TextEditingController(text: user.email);

    final userBloc = UserBloc(userRepository);

    return BlocProvider(
      create: (context) => userBloc,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  userBloc.add(UpdateProfile(
                    fullNameController.text,
                    emailController.text,
                    userNameController.text,
                  ));
                }
              },
              child: Row(
                children: [
                  const Icon(Icons.save, color: RuneTheme.borderColor),
                  const SizedBox(width: 4),
                  Text("Save",
                      style: GoogleFonts.poppins(color: RuneTheme.borderColor))
                ],
              ),
            ),
            const SizedBox(width: 18)
          ],
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: const AssetImage("assets/pp.jpg"),
                  radius: 46.0,
                  child: IconButton(
                    iconSize: 40.84,
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
                UnderlinedInput(
                  controller: fullNameController,
                  validator: UserFormValidator.validateFullName,
                  label: 'Full name',
                ),
                const SizedBox(
                  height: 18,
                ),
                UnderlinedInput(
                  validator: UserFormValidator.validateUserName,
                  controller: userNameController,
                  label: 'Username',
                ),
                const SizedBox(
                  height: 18,
                ),
                UnderlinedInput(
                  validator: UserFormValidator.validateUserName,
                  controller: emailController,
                  label: 'Email',
                ),
                BlocConsumer<UserBloc, UserState>(
                  listener: (context, state) {
                    developer.log("$state");
                    if (state is UserUpdateSuccessful) {
                      navCubit.toDashboardScreen(user, 1);
                    }

                    if (state is UserUpdateFailed) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(state.errMsg)));
                    }
                  },
                  builder: (context, state) {
                    if (state is UserUpdating)
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 30),
                          Center(
                            child: SizedBox(
                              height: 32,
                              width: 32,
                              child: CircularProgressIndicator(),
                            ),
                          )
                        ],
                      );
                    return Container();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
