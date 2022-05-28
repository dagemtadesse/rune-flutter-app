import 'package:flutter/foundation.dart';
import 'package:rune/domain/user/user_form_validators/user_validator.dart';

import 'package:rune/infrastructure/network_states.dart';

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

  NetworkState signInRequestState = NotSend(null);
  void setSignInRequestState(NetworkState newState) {
    signInRequestState = newState;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    hidePassword = !hidePassword;
    notifyListeners();
  }

  bool validateFullName() {
    fullNameValidation = UserValidator.validateFullName(fullName);
    notifyListeners();
    return fullNameValidation == null;
  }

  bool validateEmail() {
    emailValidation = UserValidator.validateEmail(email);
    notifyListeners();
    return emailValidation == null;
  }

  bool validatePassword() {
    passwordValidation = UserValidator.validatePassword(password);
    notifyListeners();
    return passwordValidation == null;
  }

  bool validateCPassword() {
    cPasswordValidation =
        UserValidator.validateConfirmPassword(cPassword, password);
    notifyListeners();
    return cPasswordValidation == null;
  }
}
