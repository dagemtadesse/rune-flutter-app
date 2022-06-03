import 'package:rune/domain/models.dart';
import 'package:rune/infrastructure/api_response.dart';
import 'package:rune/infrastructure/user/user_api_provider.dart';

class UserRepository {
  User? loggedInUser;
  UserAPIProvider userProvider =
      UserAPIProvider('http://localhost:9999/api/v1');

  Future<Expect<User>> login(String email, String password) async {
    try {
      loggedInUser = await userProvider.login(email, password);
      return Expect(loggedInUser, null);
    } catch (error) {
      String message = "Unable to Login";
      if (error is APIResponse && error.message != null) {
        message = error.message!;
      }
      return Expect(null, message);
    }
  }

  Future<Expect<User>> register(
      String email, String password, String fullname) async {
    try {
      loggedInUser = await userProvider.register(fullname, email, password);
      return Expect(loggedInUser, null);
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
      String message = "Unable to Login";
      if (error is APIResponse && error.message != null) {
        message = error.message!;
        if (error.message!.contains('Database error')) {
          message = "Email address already taken";
        }
      } else if (error is String) {
        message = error;
      }

      return Expect(null, message);
    }
  }

  changePassword(String password, String newPassword) async {
    if (loggedInUser == null) throw "Unauthorized user";
    final currentUser = await userProvider.login(loggedInUser!.email, password);
    loggedInUser = await userProvider.update(
        password: newPassword, authToken: currentUser.token!);
    return loggedInUser;
  }
}
