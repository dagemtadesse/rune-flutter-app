import 'package:drift/drift.dart';

class CachedUsers extends Table {
  IntColumn get id => integer()();
  TextColumn get fullName => text()();
  DateTimeColumn get updatedAt => dateTime()();
  TextColumn get email => text()();
  TextColumn get handle => text().nullable()();
  TextColumn get avatar => text().nullable()();
  TextColumn get token => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
