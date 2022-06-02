import 'package:drift/drift.dart';

class CachedComments extends Table {
  IntColumn get id => integer()();
  IntColumn get authorId => integer()();
  IntColumn get postId => integer()();
  TextColumn get content => text()();
  DateTimeColumn get updatedAt => dateTime()();
  IntColumn get upVote => integer()();
  IntColumn get downVote => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
