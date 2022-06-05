import 'package:rune/domain/models.dart';
import 'package:rune/infrastructure/api_response.dart';
import 'package:rune/infrastructure/cache_provider.dart';
import 'package:rune/infrastructure/repositories.dart';
import 'dart:developer' as developer;

import 'data_provider/user_api_provider.dart';
import 'data_provider/user_cache_provider.dart';

abstract class UserRepo {
  Future<Expect<User>> login(String email, String password);
  Future<Expect<User>> register(String email, String password, String fullname);
  Future<Expect<User>> changePassword(
      String password, String newPassword, String email);
  Future<Expect<User>> getUser(id);
  Future<Expect<User>> updateUser(
      {String? fullname, String? email, String? handle, bool? makeAdmin});
}

class UserRepository extends UserRepo {
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
      userCacheProvider.addUser(loggedInUser);
      return Expect(loggedInUser, null);
    } catch (error) {
      return Expect(null, resolveErrorMessage(error, "Unable to Login"));
    }
  }

  Future<Expect<User>> changePassword(
      String password, String newPassword, String email) async {
    try {
      final currentUser = await userApiProvider.login(email, password);
      loggedInUser = await userApiProvider.update(
          password: newPassword, authToken: currentUser.token!);
      userCacheProvider.addUser(loggedInUser);
      return Expect(loggedInUser, null);
    } catch (error, stackTrace) {
      developer.log("UserRepository", error: error, stackTrace: stackTrace);
      return Expect(
          null, resolveErrorMessage(error, "Unable to change password"));
    }
  }

  Future<Expect<User>> getUser(id) async {
    try {
      var user = await userCacheProvider.getUser(id);
      if (user == null) {
        user = await userApiProvider.fetchUser(id, loggedInUser.token!);
        if (user != null) userCacheProvider.addUser(user);
      }
      return Expect(user, null);
    } catch (error) {
      return Expect(null, resolveErrorMessage(error, "unable to find a user"));
    }
  }

  Future<Expect<User>> updateUser(
      {String? fullname,
      String? email,
      String? handle,
      bool? makeAdmin}) async {
    try {
      final user = await userApiProvider.update(
          fullName: fullname,
          email: email,
          handle: handle,
          authToken: loggedInUser.token!,
          grantAdminStatus: makeAdmin);
      userCacheProvider.updateUser(user);
      return Expect(user, null);
    } catch (error) {
      developer.log("$error");

      return Expect(
          null, resolveErrorMessage(error, "Unable to update a user"));
    }
  }
}
