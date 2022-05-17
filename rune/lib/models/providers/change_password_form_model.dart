import 'package:flutter/foundation.dart';
import 'package:rune/models/network/network_states.dart';
import 'package:rune/models/validators/user_validator.dart';

class ChangePasswordFormModel with ChangeNotifier {
  String oldPassword = "";
  String newPassword = "";
  String cNewPassword = ""; // confirmNewPassword

  String? oldPasswordValidation;
  String? newPasswordValidation;
  String? cNewPasswordValidation;

  bool hidePassword = true;
  NetworkState changePasswordRequest = NotSend(null);

  void togglePasswordVisibility() {
    hidePassword = !hidePassword;
    notifyListeners();
  }

  void setChangePasswordRequest(NetworkState newState) {
    changePasswordRequest = newState;
    notifyListeners();
  }

  bool validateOldPassword() {
    oldPasswordValidation = UserValidator.validatePassword(oldPassword);
    notifyListeners();
    return oldPasswordValidation == null;
  }

  bool validateNewPassword() {
    newPasswordValidation = UserValidator.validatePassword(newPassword);
    notifyListeners();
    return newPasswordValidation == null;
  }

  bool validateConfirmPassword() {
    cNewPasswordValidation =
        UserValidator.validateConfirmPassword(cNewPassword, newPassword);
    notifyListeners();
    return cNewPasswordValidation == null;
  }
}
