import 'package:flutter/material.dart';

class AuthInput extends StatelessWidget {
  const AuthInput({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

class PasswordInput extends StatefulWidget {
  const PasswordInput(
      {Key? key,
      required this.controller,
      required this.textHint,
      required this.validator,
      this.allowPeek = true})
      : super(key: key);

  final TextEditingController controller;
  final String textHint;
  final String? Function(String?) validator;
  final bool allowPeek;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: !_showPassword,
      validator: widget.validator,
      decoration: InputDecoration(
        suffixIcon: widget.allowPeek
            ? IconButton(
                icon: Icon(
                    _showPassword ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _showPassword = !_showPassword;
                  });
                },
              )
            : null,
        hintText: widget.textHint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
