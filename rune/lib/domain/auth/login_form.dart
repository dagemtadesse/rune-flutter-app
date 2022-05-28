import 'package:flutter/foundation.dart';
import 'package:rune/infrastructure/network_states.dart';

class LoginFormModel with ChangeNotifier {
  String email = "";
  String password = "";

  bool hidePassword = true;

  String? emailValidation;
  String? passwordValidation;

  NetworkState loginRequestState = NotSend(null);

  void togglePasswordVisibility() {
    hidePassword = !hidePassword;
    notifyListeners();
  }

  void setLoginRequestState(NetworkState newState) {
    loginRequestState = newState;
    notifyListeners();
  }

  bool validateEmail() {
    if (email.isEmpty) {
      emailValidation = "Email Could not be empty";
    } else {
      emailValidation = null;
    }
    notifyListeners();
    return emailValidation == null;
  }

  bool validatePassword() {
    if (password.isEmpty) {
      passwordValidation = "password Could not be empty";
    } else {
      passwordValidation = null;
    }
    notifyListeners();
    return passwordValidation == null;
  }
}
