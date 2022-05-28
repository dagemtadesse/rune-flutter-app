import 'package:flutter/foundation.dart';

enum Pages {
  splashPage,
  signInPage,
  signUpPage,
  changePasswordPage,
  homePage,
  profilePage,
  searchPage,
  bookmarksPage,
  channelListPage,
  postsPage,
  commentsPage,
  editProfilePage,
  channelPage,
  createChannelPage
}

class PageModel with ChangeNotifier {
  Pages currentPage = Pages.splashPage;

  void setCurrentPage(Pages newPage) {
    currentPage = newPage;
    notifyListeners();
  }
}
