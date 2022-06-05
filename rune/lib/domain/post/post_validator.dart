class PostValidator {
  static String? validateTitle(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please provide post titile";
    }

    if (value.length >= 120 && value.length <= 6) {
      return "Please provide descriptive titile";
    }

    return null;
  }

  static String? validateContnet(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please provide post titile";
    }

    if (value.length >= 500) {
      return "The description cannot excede 500 characters";
    }

    return null;
  }
}
