import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbProduct {
  static final DbProduct _instance = DbProduct._internal();
  factory DbProduct() => _instance;
  DbProduct._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'football.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE favorite_prdouct(id INTEGER PRIMARY KEY AUTOINCREMENT, isFav INTEGER)',
        );
      },
    );
  }

  Future<List<Map<String, dynamic>>> getFavoriteProduct() async {
    final client = await db;
    return client.query('favorite_prdouct', orderBy: 'id DESC');
  }

  Future<int> deleteFavorite(int id) async {
    final client = await db;
    return await client.delete(
      'favorite_prdouct',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Map<String, dynamic>>> getFavorite() async {
    final client = await db;
    return client.query(
      'favorite_prdouct',
      where: 'isFav = ?',
      whereArgs: [1],
      orderBy: 'id DESC',
    );
  }
}
