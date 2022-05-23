import 'package:flutter/foundation.dart';
import 'package:rune/models/models.dart';
import 'package:rune/models/providers/provider.dart';

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

enum ChannelTab { trending, pinned }

class PageModel with ChangeNotifier {
  late Future<Channels> channels;
  late Future<Posts> posts;

  Pages currentPage = Pages.splashPage;
  ChannelTab channelTab = ChannelTab.trending;
  String channelQuery = "";
  int channelPage = 0;
  String order = 'asc';

  void setChannelTab(ChannelTab tab) {
    channelTab = tab;
    notifyListeners();
  }

  void setCurrentPage(Pages newPage) {
    currentPage = newPage;
    notifyListeners();
  }

  void setChannels(Future<Channels> newChannels) {
    channels = newChannels;
    notifyListeners();
  }

  void setPosts(Future<Posts> posts) {
    this.posts = posts;
    notifyListeners();
  }

  void setQuery(String query) {
    channelQuery = query;
    notifyListeners();
  }

  void toggleOrdering() {
    order = order == 'asc' ? 'desc' : 'asc';
    // print(order);
    notifyListeners();
  }
}
