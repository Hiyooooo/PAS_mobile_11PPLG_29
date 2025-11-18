import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbProduct {
  static final DbProduct _instance = DbProduct._internal();
  factory DbProduct() => _instance;
  DbProduct._internal();

  Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'product.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE favorite_product('
          'product_id INTEGER PRIMARY KEY,'
          'isFav INTEGER NOT NULL'
          ')',
        );
      },
    );
  }

  Future<List<int>> getFavoriteIds() async {
    final db = await database;
    final rows = await db.query(
      'favorite_product',
      where: 'isFav = ?',
      whereArgs: [1],
    );

    return rows.map<int>((row) => row['product_id'] as int).toList();
  }

  Future<void> setFavorite(int productId, bool isFav) async {
    final db = await database;

    if (isFav) {
      await db.insert('favorite_product', {
        'product_id': productId,
        'isFav': 1,
      }, conflictAlgorithm: ConflictAlgorithm.replace);
    } else {
      await db.delete(
        'favorite_product',
        where: 'product_id = ?',
        whereArgs: [productId],
      );
    }
  }
}
