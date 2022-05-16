import 'package:flutter/foundation.dart';
import 'package:rune/models/validators/validators.dart';

class RegistrationFromModel with ChangeNotifier {
  String fullName = "";
  String email = "";
  String password = "";
  String cPassword = "";

  String? fullNameValidationMsg;
  String? emailValidationMsg;
  String? passwordValidationMsg;
  String? cPasswordValidationMsg;

  void validateFullName() {
    fullNameValidationMsg = UserValidator.validateFullName(fullName);
    notifyListeners();
  }

  void validateEmail() {
    emailValidationMsg = UserValidator.validateEmail(email);
    notifyListeners();
  }

  void validatePassword() {
    passwordValidationMsg = UserValidator.validatePassword(password);
    notifyListeners();
  }

  void validateCPassword() {
    cPasswordValidationMsg =
        UserValidator.validateConfirmPassword(cPassword, password);
    notifyListeners();
  }
}
