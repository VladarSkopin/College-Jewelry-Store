
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/catalog_model.dart';

class CartDatabase {
  static final CartDatabase instance = CartDatabase._init();

  static Database? _database;

  CartDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('cart.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path= join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final integerType = 'INTEGER NOT NULL';
    final textType = 'TEXT NOT NULL';

    await db.execute('''
    CREATE TABLE $tableCart (
      ${CartFields.id} $idType,
      ${CartFields.price} $integerType,
      ${CartFields.label} $textType,
      ${CartFields.imgUrl} $textType,
      ${CartFields.type} $textType,
      ${CartFields.metal} $textType,
      ${CartFields.gem} $textType
    )
    ''');

/*
    await db.execute('''
    CREATE TABLE users (
      id $idType,
      name $textType,
      login $textType,
      email $textType,
      password $textType
    )
    ''');
 */
  }

  Future<Jewelry> create(Jewelry jewelry) async {
    final db = await instance.database;


    // IF YOU WANT TO INSERT RAW STATEMENT

    /* final json = note.toJson();
    final columns =
        '${NoteFields.title}, ${NoteFields.description}, ${NoteFields.time}';
    final values =
        '${json[NoteFields.title]} ${json[NoteFields.description]}, ${json[NoteFields.time]}';
    final id = await db
    .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');
   */


    // THIS CODE IS DOING BASICALLY THE SAME AS ABOVE

    final id = await db.insert(tableCart, jewelry.toJson());
    return jewelry.copy(id: id);
  }

  Future<Jewelry> readJewelry(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableCart,
      columns: CartFields.values,
      where: '${CartFields.id} = ?', // for each "?" you put "id" -> whereArgs
      whereArgs: [id]
      // where: '${NoteFields.id} = ? ? ?',
      // whereArgs: [id, value1, value2] // multiple values
    );

    if (maps.isNotEmpty) {
      return Jewelry.fromJson(maps.first); // retrieve the first row (?)
    } else {
      throw Exception('ID $id OF JEWELRY NOT FOUND !');
    }
  }

  Future<List<Jewelry>> readAllJewelry() async {
    final db = await instance.database;

    final orderBy = '${CartFields.type} ASC';
    final result = await db.query(tableCart, orderBy: orderBy);

    // final result = await db.query(tableNotes, where: , groupBy: ...);
    // ANOTHER WAY - RAW QUERY:
    // final result = await db.query('SELECT * FROM $tableNotes ORDER BY $orderBy');

    return result.map((json) => Jewelry.fromJson(json)).toList();
  }

  Future<int> update(Jewelry jewelry) async {
    final db = await instance.database;

    return db.update(
      tableCart,
      jewelry.toJson(),
      where: '${CartFields.id} = ?',
      whereArgs: [jewelry.id]
    );
  }


  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableCart,
      where: '${CartFields.id} = ?',
      whereArgs: [id]
    );
  }

  Future deleteAll() async {
    final db = await instance.database;

    //return await db.delete(tableCart);
    //return await db.rawDelete('DELETE FROM $tableCart WHERE 1 = 1');

    return await db.delete(
        tableCart,
        where: '1 = 1'
    );
  }


  Future close() async {
    final db = await instance.database;
    db.close();
  }


/*
  Future close() async {
    final db = await instance.database;
    _database = null;
    return db.close();
  }
*/

}