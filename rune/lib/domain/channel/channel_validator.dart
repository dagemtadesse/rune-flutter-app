class ChannelValidator {
  static String? validateChannelName(String? channelName) {
    if (channelName == null || channelName.trim().isEmpty) {
      return "Please enter a channel Name ";
    }
    if (!RegExp(r'^[a-z A-Z]+$').hasMatch(channelName)) {
      return "Please Enter a correct name";
    }

    return null;
  }

  static String? validateDesc(String? description) {
    if (description== null||description.trim().isEmpty) {
      return 'Please enter a description for your channel';
    }

    if (!RegExp(r'[A-Z a-z 0-9 !@#$%^&*(),.?":{}|<>]').hasMatch(description)) {
      return 'enter a valid description';
    }
    return null;
  }

  static String? validateEmail(String? email) {
    if (email==null ||email.trim().isEmpty) {
      return 'Please enter your email address';
    }

    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(email)) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  static String? validateLocation(String? location) {
    if (location== null ||location.trim().isEmpty) {
      return 'Please enter a description for your channel';
    }

    if (!RegExp(r'[A-Z a-z 0-9]').hasMatch(location)) {
      return 'please enter a valid Location';
    }
    return null;
  }
}
