import 'package:drift/drift.dart';
import 'package:rune/infrastructure/channel/channel_cache_model.dart';
import 'package:rune/infrastructure/comment/comment_cache_model.dart';
import 'package:rune/infrastructure/post/post_cache_model.dart';
import 'package:rune/infrastructure/user/user_cache_model.dart';

part 'cache_provider.g.dart';

@DriftDatabase(
    tables: [CachedUsers, CachedChannels, CachedComments, CachedPosts])
class CacheDatabase extends _$CacheDatabase {
  CacheDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  Future<int> addUser(CachedUser user) {
    return into(cachedUsers).insert(
      CachedUsersCompanion.insert(
          id: Value(user.id),
          fullName: user.fullName,
          email: user.email,
          updatedAt: user.updatedAt,
          handle: Value(user.handle),
          avatar: Value(user.avatar),
          token: Value(user.token)),
    );
  }

  Future<void> updateUser(CachedUser user) {
    return update(cachedUsers).replace(user);
  }

  Future<CachedUser> getUser(int id) {
    return (select(cachedUsers)..where((u) => u.id.equals(id))).getSingle();
  }

  Future deleteUser(int id) {
    return (delete(cachedUsers)..where((user) => user.id.equals(id))).go();
  }
}

// LazyDatabase _openConnection() {
//   return LazyDatabase(() async {
//     final dbFolder = await getApplicationDocumentsDirectory();
//     final file = File(p.join(dbFolder.path, 'db.sqlite'));
//     return NativeDatabase(file);
//   });
// }
