import 'package:drift/drift.dart';

class CachedPosts extends Table {
  IntColumn get id => integer()();
  IntColumn get authorId => integer()();
  IntColumn get channelId => integer()();

  TextColumn get title => text()();
  TextColumn get content => text()();
  TextColumn get image => text().nullable()();

  DateTimeColumn get updatedAt => dateTime()();
  IntColumn get upVote => integer()();
  IntColumn get downVote => integer()();
  TextColumn get vote => text()();

  @override
  Set<Column> get primaryKey => {id};
}
