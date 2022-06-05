import 'package:rune/domain/models.dart';
import 'package:rune/infrastructure/cache_provider.dart';

class UserCacheProvider {
  final CacheDatabase db;

  UserCacheProvider(this.db);

  Future<User?> getUser(int id) async {
    final mapped = await db.getRow('users', id);

    if (mapped.isEmpty) {
      return null;
    }
    return User.fromJson(mapped.first);
  }

  Future<void> removeUser(int id) async {
    await db.delete('users', id);
  }

  Future<void> addUser(User user) async {
    final map = user.toJson();
    await db.insert('users', map);
  }

  Future<void> updateUser(User user) async {
    await db.update('users', user.toJson());
  }
}
