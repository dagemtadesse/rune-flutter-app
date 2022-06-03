import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rune/application/blocs.dart';

import '../../../theme.dart';

class AuthButton extends StatelessWidget {
  final void Function() dispatcher;
  final String label;
  final GlobalKey<FormState> formKey;

  const AuthButton(
      {Key? key,
      required this.dispatcher,
      required this.formKey,
      required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              print(state);
              if (state is AuthRequestFailure) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message)));
              }

              if (state is AuthRequestSuccess) {
                final navCubit = context.read<NavigationCubit>();
                navCubit.toDashboardScreen(state.loggedUser);
              }
            },
            builder: (context, state) {
              return TextButton(
                style: SplashTheme.buttonTheme,
                child: state is! AuthRequestSent
                    ? Text(label, style: SplashTheme.textTheme.labelMedium)
                    : const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                onPressed: state is! AuthRequestSent
                    ? () {
                        if (formKey.currentState!.validate()) {
                          dispatcher();
                        }
                      }
                    : null,
              );
            },
          ),
        ),
      ],
    );
  }
}
