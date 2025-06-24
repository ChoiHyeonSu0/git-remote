import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:triptest/models/user_info.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if(_database != null) return _database!;
    _database = await _initDB("user_info.db");
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1,
        onCreate: _createDB
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      create table user_info(
       id INTEGER PRIMARY KEY AUTOINCREMENT,
       name TEXT,
       email TEXT,
       profileImagePath TEXT
       )
    ''');
  }

  Future<void> insertOrUpdateUser(UserInfo userInfo) async {
    final db = await instance.database;
    
    await db.delete('user_info');
    await db.insert('user_info', userInfo.toMap());
  }
  Future<UserInfo?> getUser() async {
    final db = await instance.database;
    final maps = await db.query('user_info');
    if(maps.isNotEmpty) {
      return UserInfo.fromMap(maps.first);
    }
    return null;
  }
  Future close() async {
    final db = await instance.database;
    db.close();
  }
}