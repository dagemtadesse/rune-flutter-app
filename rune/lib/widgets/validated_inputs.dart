import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rune/models/providers/provider.dart';

class ValidateInput extends StatelessWidget {
  final String placeholder;
  final String? validationMsg;
  final bool? hidePassword;
  final void Function()? toggler;
  final void Function(String) setter;

  const ValidateInput({
    Key? key,
    this.toggler,
    this.hidePassword,
    this.validationMsg,
    required this.setter,
    required this.placeholder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconButton? visibilityButton;

    if (hidePassword != null) {
      visibilityButton = IconButton(
        enableFeedback: false,
        icon: Icon(
          hidePassword! ? Icons.visibility : Icons.visibility_off,
        ),
        onPressed: () {
          toggler?.call();
        },
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          onChanged: (value) => setter(value),
          obscureText: hidePassword ?? false,
          decoration: InputDecoration(
            hintText: placeholder,
            suffixIcon: visibilityButton,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        if (validationMsg != null) const SizedBox(height: 8.0),
        if (validationMsg != null)
          Text(
            validationMsg!,
            style: const TextStyle(color: Colors.red),
          ),
      ],
    );
  }
}
