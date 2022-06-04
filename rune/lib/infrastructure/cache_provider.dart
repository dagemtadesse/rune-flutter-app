import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';

class CacheDatabase {
  Database? _database;

  final String createUserTable = '''
  CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY,
      fullName TEXT NOT NULL,
      handle TEXT,
      email TEXT NOT NULL,
      avatar TEXT,
      updatedAT DATETIME NOT NULL,
      token TEXT
  )
  ''';

  final String createCommentsTable = '''
  CREATE TABLE IF NOT EXISTS comments (
    id INTEGER PRIMARY KEY,
    authorId INTEGER NOT NULL,
    postId INTEGER NOT NULL,
    content TEXT NOT NULL,
    updatedAt DATETIME NOT NULL,
    upVote INTEGER NOT NULL,
    downVote INTEGER NOT NULL,
    vote Text NOT NULL
  )
  ''';

  final String createChannelTable = '''
  CREATE TABLE IF NOT EXISTS channels(
    id INTEGER PRIMARY KEY,
      authorId INTEGER NOT NULL,
      name TEXT NOT NULL,
      descritption TEXT NOT NULL,
      pinned bool NOT NULL,
      updatedAT DATETIME NOT NULL,
      logo TEXT,
      email TEXT,
      address TEXT
  )
  ''';

  final String createPostTable = '''
  CREATE TABLE IF NOT EXISTS posts (
    id INTEGER PRIMARY KEY,
    authorId INTEGER NOT NULL,
    channelId INTEGER NOT NULL,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    image TEXT,
    updatedAt DATETIME NOT NULL,
    upVote INTEGER NOT NULL,
    downVote INTEGER NOT NULL,
    vote Text NOT NULL
  )
  ''';

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    WidgetsFlutterBinding.ensureInitialized();
    _database = await openDatabase(
      join(await getDatabasesPath(), 'rune_cache.db'),
      version: 1,
      onCreate: (db, version) {
        db.execute(createUserTable);
        db.execute(createChannelTable);
        db.execute(createCommentsTable);
        db.execute(createPostTable);
      },
    );

    return _database!;
  }

  Future<void> insert(String table, Map<String, dynamic> data) async {
    (await database)
        .insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> fetchRows(String table) async {
    return (await database).query(table);
  }

  Future<List<Map<String, dynamic>>> getRow(String table, int id) async {
    final rows = await (await database)
        .query(table, where: "id = ?", whereArgs: [id], limit: 1);
    return rows;
  }

  Future<void> delete(String table, int id) async {
    (await database).delete(table, where: "id = ? ", whereArgs: [id]);
  }

  Future<void> update(String table, Map<String, dynamic> data) async {
    (await database).update(
      table,
      data,
      where: 'id = ?',
      whereArgs: [data['id']],
    );
  }
}
