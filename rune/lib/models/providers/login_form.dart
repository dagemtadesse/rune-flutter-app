import 'package:flutter/foundation.dart';

class LoginFormModel with ChangeNotifier {
  String email = "";
  String password = "";

  bool hidePassword = true;

  String? emailValidation;
  String? passwordValidation;

  void togglePasswordVisibility() {
    hidePassword = !hidePassword;
    notifyListeners();
  }

  void validateEmail() {
    if (email.isEmpty) {
      emailValidation = "Email Could not be empty";
    } else {
      emailValidation = null;
    }
    notifyListeners();
  }

  void validatePassword() {
    if (password.isEmpty) {
      passwordValidation = "password Could not be empty";
    } else {
      passwordValidation = null;
    }
    notifyListeners();
  }
}
