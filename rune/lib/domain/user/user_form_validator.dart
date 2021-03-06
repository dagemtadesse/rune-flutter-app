import 'package:flutter/cupertino.dart';

class UserFormValidator {
  static String? validateFullName(String? fullName) {
    if (fullName == null || fullName.trim().isEmpty) {
      return "Please enter your full name";
    }
    if (!RegExp(r'^[a-z A-Z]+$').hasMatch(fullName)) {
      return "Please Enter a correct name";
    } else {
      return null;
    }
  }

  static String? validateEmail(String? email) {
    if (email == null || email.trim().isEmpty) {
      return 'Please enter your email address';
    }

    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(email)) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.trim().isEmpty) {
      return 'Please enter your password';
    }
    if (password.trim().length < 8) {
      return 'Password must be at least 8 characters in length';
    }
    return null;
  }

  static String? validateConfirmPassword(
      String? cPassword, TextEditingController password) {
    if (cPassword == null || cPassword.isEmpty) {
      return 'This field is required';
    }

    if (password.text != cPassword) {
      return 'Confirmation password does not match the entered password';
    }

    return null;
  }

  static String? validateUserName(String? userName) {
    return null;
  }
}
