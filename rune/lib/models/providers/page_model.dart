import 'package:flutter/foundation.dart';

enum Pages {
  SPLASH_PAGE,
  SIGN_IN_PAGE,
  SIGN_UP_PAGE,
}

class PageModel with ChangeNotifier {
  Pages currentPage = Pages.SPLASH_PAGE;

  void setCurrentPage(Pages newPage) {
    currentPage = newPage;
    notifyListeners();
  }
}
