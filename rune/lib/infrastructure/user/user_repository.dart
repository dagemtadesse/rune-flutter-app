import 'package:rune/domain/models.dart';
import 'package:rune/infrastructure/api_response.dart';
import 'package:rune/infrastructure/cache_provider.dart';
import 'package:rune/infrastructure/user/user_api_provider.dart';
import 'package:rune/infrastructure/user/user_cache_provider.dart';
import 'dart:developer' as developer;

class UserRepository {
  late User loggedInUser;

  UserCacheProvider userCacheProvider;
  UserAPIProvider userApiProvider;

  UserRepository(CacheDatabase database, String host)
      : userCacheProvider = UserCacheProvider(database),
        userApiProvider = UserAPIProvider(host);

  Future<Expect<User>> login(String email, String password) async {
    try {
      final user = await userApiProvider.login(email, password);
      developer.log("${user}");
      // save the user to db
      loggedInUser = user;
      userCacheProvider.addUser(loggedInUser);
      return Expect(loggedInUser, null);
    } catch (error, stacktrace) {
      developer.log('Logging error', error: error, stackTrace: stacktrace);
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
      loggedInUser = await userApiProvider.register(fullname, email, password);
      // save the user to db
      // userCacheProvider.addUser(loggedInUser!);
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

  Future<Expect<User>> changePassword(
      String password, String newPassword, String email) async {
    try {
      final currentUser = await userApiProvider.login(email, password);
      loggedInUser = await userApiProvider.update(
          password: newPassword, authToken: currentUser.token!);
      return Expect(loggedInUser, null);
    } catch (error, stackTrace) {
      developer.log("UserRepository", error: error, stackTrace: stackTrace);
      String message = "Unable to Change password";
      if (error is APIResponse && error.message != null) {
        message = error.message!;
        if (error.message!.contains('Database error')) {
          message = "Email address already taken";
        }
      }
      if (error is String) {
        message = error;
      }

      return Expect(null, message);
    }
  }

  Future<Expect<User>> getUser(id) async {
    try {
      var user = await userCacheProvider.getUser(id);
      if (user == null)
        user = await userApiProvider.fetchUser(id, loggedInUser.token!);

      return Expect(user, null);
    } catch (error) {
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
}
