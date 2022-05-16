import 'package:flutter/foundation.dart';
import 'package:rune/models/validators/validators.dart';

class RegistrationFromModel with ChangeNotifier {
  String fullName = "";
  String email = "";
  String password = "";
  String cPassword = "";

  String? fullNameValidation;
  String? emailValidation;
  String? passwordValidation;
  String? cPasswordValidation;

  bool hidePassword = true;

  void togglePasswordVisibility() {
    hidePassword = !hidePassword;
    notifyListeners();
  }

  void validateFullName() {
    fullNameValidation = UserValidator.validateFullName(fullName);
    notifyListeners();
  }

  void validateEmail() {
    emailValidation = UserValidator.validateEmail(email);
    notifyListeners();
  }

  void validatePassword() {
    passwordValidation = UserValidator.validatePassword(password);
    notifyListeners();
  }

  void validateCPassword() {
    cPasswordValidation =
        UserValidator.validateConfirmPassword(cPassword, password);
    notifyListeners();
  }
}
