import 'package:college_jewelry_store/models/transaction_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class OperationHistoryDatabase {
  static final OperationHistoryDatabase instance = OperationHistoryDatabase._init();

  static Database? _database;

  OperationHistoryDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('operationsHistory.db');
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

    await db.execute('''
    CREATE TABLE $tableOperationsHistory (
      ${TransactionFields.id} $idType,
      ${TransactionFields.login} $textType,
      ${TransactionFields.itemLabel} $textType,
      ${TransactionFields.itemPrice} $integerType,
      ${TransactionFields.transactionDateMillis} $integerType
    )
    ''');
  }

/*
  Future writeTransaction({
    required String login,
    required String itemLabel,
    required int itemPrice,
    required int dateTimeMillis}) async {
    final db = await instance.database;

    // INSERT RAW STATEMENT
    const columns = 'login, itemLabel, itemPrice, transactionDateMillis';
    //final values = '$login $itemLabel $itemPrice $dateTimeMillis';
    await db.rawInsert('INSERT INTO tableOperationsHistory ($columns) VALUES (?, ?, ?, ?)', [login, itemLabel, itemPrice, dateTimeMillis]);

  }
*/

  Future<TransactionInfo> writeTransactionInfo(TransactionInfo ti) async {
    final db = await instance.database;
    final id = await db.insert(tableOperationsHistory, ti.toJson());
    return ti.copy(id: id);
  }

  Future<List<TransactionInfo>> readAllTransactions() async {
    final db = await instance.database;

    final orderBy = '${TransactionFields.transactionDateMillis} DESC';
    final result = await db.query(tableOperationsHistory, orderBy: orderBy);
    return result.map((json) => TransactionInfo.fromJson(json)).toList();
  }

  Future deleteAll() async {
    final db = await instance.database;
    return await db.delete(
        tableOperationsHistory,
        where: '1 = 1'
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

}
