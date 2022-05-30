import 'package:drift/drift.dart';

class UserCacheProvider extends Table {
  IntColumn get id => integer()();
  TextColumn get fullName => text().withLength(min: 2, max: 80)();
  TextColumn get email => text()();
  TextColumn get handle => text()();
  TextColumn get avatar => text()();
  TextColumn get token => text()();
}
