import 'dart:io';

import 'package:rune/domain/models.dart';
import 'package:rune/infrastructure/user/data_provider/user_api_provider.dart';
import 'package:test/test.dart';
import 'package:rune/infrastructure/api_response.dart';

void main() {
  final UserAPIProvider userAPIProvider =
      UserAPIProvider("http://localhost:9999/api/v1");
  late User newUser;

  group("userAPI providerTest", () {
    test("should create a user", () async {
      newUser = await userAPIProvider.register(
        "Rand al'Thor",
        "anakin@jedia.academy",
        "JediPassword",
      );
      expect(newUser, isNot(null));
    });

    test("Should not create a user", () async {
      registerWithDuplicateEmail() async => await userAPIProvider.register(
            "Rand al'Thor",
            "anakin@jedia.academy",
            "JediPassword",
          );
      expectLater(registerWithDuplicateEmail(), throwsA(isA<APIResponse>()));
    });

    test('Should sign in a valid the user', () async {
      final user =
          await userAPIProvider.login("anakin@jedia.academy", "JediPassword");

      expect(user.email, "anakin@jedia.academy");
      expect(user.fullName, "Rand al'Thor");
    });

    test('Should not sign in a non existent e user', () async {
      login() async => await userAPIProvider.login(
            "anakin@darth.academy",
            "JediPassword",
          );

      expectLater(login, throwsA(isA<APIResponse>()));
    });

    test('Should fetch a the user', () async {
      final differentUser =
          await userAPIProvider.fetchUser(newUser.id, newUser.token!);

      expect(differentUser?.email, "anakin@jedia.academy");
      expect(differentUser?.fullName, "Rand al'Thor");
    });

    test('should update a user', () async {
      final updatedUser = await userAPIProvider.update(
          imagePath: 'test_resources/images.jpeg',
          fullName: "Lord Rand al'Thor",
          email: 'Superman@email.place',
          authToken: newUser.token!);

      expect(updatedUser.email, 'rand@dragonmound.place');
      expect(updatedUser.avatar, isNot(null));
      expect(updatedUser.fullName, "Lord Rand al'Thor");
    });

    test('Should remove a user', () async {
      await userAPIProvider.removeAccount(newUser.token!);
    });
  });
}
