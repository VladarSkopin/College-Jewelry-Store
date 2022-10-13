import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/catalog_model.dart';

class OperationHistoryDatabase {
  static final OperationHistoryDatabase instance = OperationHistoryDatabase._init();

  static Database? _database;

  OperationHistoryDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('operationHistory.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const integerType = 'INTEGER NOT NULL';
    const textType = 'TEXT NOT NULL';
    const dateType = '???'; // ???


    await db.execute('''
    CREATE TABLE operationHistoryTable (
    id $idType,
    login $textType,
    itemLabel $textType,
    itemPrice $integerType,
    transactionDate $dateType
    )
    ''');
  }

}
