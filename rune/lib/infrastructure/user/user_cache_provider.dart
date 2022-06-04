import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class RuneDatabase {
  late final Database database;

  getInstace() async {
    WidgetsFlutterBinding.ensureInitialized();
    database = await openDatabase(
      join(await getDatabasesPath(), "rune_cache.db"),
      onCreate: (db, version) async {
        await db.execute(createUsers);
        await db.execute(createPosts);
        await db.execute(createComments);
        await db.execute(createChannel);
      },
    );
  }

  static const createUsers = '''
    CREATE TABLE IF NOT users(
      id INTEGER PRIMARY KEY,
      fullName Text NOT NULL,
      email Text NOT NULL,
      handle Text,
      updatedAt DATETIME NOT NULL,
      token Text);
  ''';

  static const createPosts = '''
  CREATE TABLE IF NOT posts (
    id INTEGER PRIMARY KEY,
    authorId INTEGER NOT NULL,
    channelId INTEGER NOT NULL,
    title TEXT NOT NULL,
    context TEXT NOT NULL,
    image TEXT NOT NULL,
    updatedAt DATETIME,
    upVote INTEGER  NOT NULL,
    downVOTE INTEGER  NOT NULL,
    vote TEXT NOT NULL);
  ''';

  static const createComments = '''
  CREATE TABLE IF NOT comments (
    id INTEGER PRIMARY KEY,
    authorId INTEGER NOT NULL,
    postId INTEGER NOT NULL,
    content TEXT,
    updatedAt DATETIME,
    upVote INTEGER,
    downVote INTEGER);
  ''';

  static const createChannel = ''' 
  CREATE TABLE IF NOT channels (
    id INTEGER PRIMARY KEY,
    authorId INTEGER NOT NULL,
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    address TEXT,
    updatedAt DATETIME NOT NULL,
    email text,
    logo text,
    pinned bool,
    verified bool);
  ''';
}
