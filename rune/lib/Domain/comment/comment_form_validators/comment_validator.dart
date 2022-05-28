class CommentValidator{
  static String? validateDesc(String comment) {
    if (comment.trim().isEmpty) {
      return 'Please enter a comment';
    }

    if (!RegExp(r'[A-Z a-z 0-9 !@#$%^&*(),.?":{}|<>]').hasMatch(comment)) {
      return 'enter a valid comment';
     
    }
    return null;
  }
}