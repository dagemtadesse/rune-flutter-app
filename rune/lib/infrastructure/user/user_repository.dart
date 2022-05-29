import 'package:rune/domain/models.dart';
import 'package:rune/infrastructure/user/user_api_provider.dart';

class UserRepository {
  User? loggedInUser;
  UserAPIProvider userProvider =
      UserAPIProvider('http://localhost:9999/api/v1');

  login(String email, String password) async {
    loggedInUser = await userProvider.login(email, password);
  }

  register(String email, String password, String fullname) async {
    loggedInUser = await userProvider.register(fullname, email, password);
  }

  changePassword(String password, String newPassword) async {}
}
