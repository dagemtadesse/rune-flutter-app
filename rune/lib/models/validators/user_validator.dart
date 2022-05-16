class UserValidator {

  static String? validateFullName(String fullName) {
    if (fullName == null || fullName.trim().isEmpty) {
      return "Please enter your full name";
    }
    if (!RegExp(r'^[a-z A-Z]+$').hasMatch(fullName)) {
      return "Please Enter a correct name";
    } else {
      return null;
    }
  }

  static String? validateEmail(String email) {
    if (email == null || email.trim().isEmpty) {
      return 'Please enter your email address';
    }

    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(email)) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  static String? validatePassword(String password) {
    if (password == null || password.trim().isEmpty) {
      return 'This field is required';
    }
    if (password.trim().length < 8) {
      return 'Password must be at least 8 characters in length';
    }
    return null;
  }

  static String? validateConfirmPassword(
      String cPassword, String password) {
    if (password == null || password.isEmpty) {
      return 'This field is required';
    }

    if (password != cPassword) {
      return 'Confimation password does not match the entered password';
    }

    return null;
  }

  static String? validateUserName(String userName) {
    if (userName == null || userName.trim().isEmpty) {
      return "Username can't be empty";
    }
    if (userName.trim().length < 4) {
      return 'Username must be at least 4 characters in length';
    }
    return null;
  }
}
