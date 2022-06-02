import 'package:drift/native.dart';
import 'package:rune/infrastructure/cache_provider.dart';
import 'package:test/test.dart';

void main() {
  late CacheDatabase database;
  CachedUser testUser = CachedUser(
      id: 1,
      fullName: "Test Tested",
      updatedAt: DateTime.now(),
      email: 'test@test.com');

  CachedUser testUser2 = CachedUser(
      id: 2,
      fullName: 'Test Will Test',
      updatedAt: DateTime.now(),
      email: 'test@mail.com');

  group('User Cache provider test', () {
    setUp(() {
      database = CacheDatabase(NativeDatabase.memory());
    });

    tearDown(() async {
      await database.close();
    });

    test('Should create a new user', () async {
      final id = await database.addUser(testUser);

      expect(id, testUser.id);
    });

    test('Should get a user', () async {
      final id = await database.addUser(testUser);
      final user = await database.getUser(id);

      expect(id, user.id);
    });

    test('Should update a user', () async {
      final id = await database.addUser(testUser);
      var user = await database.getUser(id);
      expect(user.fullName, testUser.fullName);

      await database.addUser(testUser2);
      user = await database.getUser(id);
      expect(user.fullName, testUser.fullName);
    });

    test('Should delete a user', () async {
      final id = await database.addUser(testUser);

      final deletedColumns = await database.deleteUser(id);
      expect(deletedColumns, 1);
    });
  });
}
