import 'package:drift/drift.dart';

class CachedChannels extends Table {
  IntColumn get id => integer()();
  IntColumn get authorId => integer()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  TextColumn get address => text()();
  DateTimeColumn get createdAt => dateTime().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get logo => text().nullable()();
  BoolColumn get verfied => boolean()();
  BoolColumn get pinned => boolean()();

  @override
  Set<Column> get primaryKey => {id};
}
