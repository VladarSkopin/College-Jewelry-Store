import 'package:college_jewelry_store/models/users_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class UsersDatabase {
  static final UsersDatabase instance = UsersDatabase._init();

  static Database? _database;

  UsersDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('users.db');
    return _database!;
  }

  Future<Database> _initDB(String filepath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filepath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';

    await db.execute('''
    CREATE TABLE $tableUsers (
      ${UsersFields.id} $idType,
      ${UsersFields.userName} $textType,
      ${UsersFields.login} $textType,
      ${UsersFields.email} $textType,
      ${UsersFields.password} $textType
    )
    ''');
  }

  Future<User?> create(User user) async {
    final db = await instance.database;

    final maps = await db.query(
        tableUsers,
        columns: UsersFields.values,
        where: '${UsersFields.login} = ?',
        whereArgs: [user.login]
    );

    if (maps.isEmpty) {
      final id = await db.insert(tableUsers, user.toJson());
      return user.copy(id: id);
    } else {
      throw Exception('USER LOGIN = ${user.login} ALREADY EXISTS !!!');
    }


  }

  Future<User?> createAdmin(User userAdmin) async {
    final db = await instance.database;

    final maps = await db.query(
      tableUsers,
      columns: UsersFields.values,
      where: '${UsersFields.login} = ?',
      whereArgs: ['admin']
    );

    if (maps.isEmpty) {
      final id = await db.insert(tableUsers, userAdmin.toJson());
      return userAdmin.copy(id: id);
    }
    return null;
  }

  Future<User> readUser(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableUsers,
      columns: UsersFields.values,
      where: '${UsersFields.id} = ?',
      whereArgs: [id]
    );

    if (maps.isNotEmpty) {
      return User.fromJson(maps.first);
    } else {
      throw Exception('ID $id OF USERS NOT FOUND !');
    }
  }

  Future<bool> readUserLogin(String login) async {
    final db = await instance.database;

    final maps = await db.query(
        tableUsers,
        columns: UsersFields.values,
        where: '${UsersFields.login} = ?',
        whereArgs: [login]
    );

    if (maps.isNotEmpty) {
      //return User.fromJson(maps.first).login;
      return true;
    } else {
      return false;
      //throw Exception('LOGIN = $login NOT FOUND !!!');
    }
  }


  Future<bool> readUserPassword(String password) async {
    final db = await instance.database;

    final maps = await db.query(
        tableUsers,
        columns: UsersFields.values,
        where: '${UsersFields.password} = ?',
        whereArgs: [password]
    );

    if (maps.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<String> getUserName(String login) async {
    final db = await instance.database;

    final maps = await db.query(
        tableUsers,
        columns: UsersFields.values,
        where: '${UsersFields.login} = ?',
        whereArgs: [login]
    );

    if (maps.isNotEmpty) {
      return User.fromJson(maps.first).userName;
    } else {
      return 'Пользователь';
    }
  }


  Future<List<User>> readAllUsers() async {
    final db = await instance.database;

    final orderBy = '${UsersFields.login} ASC';
    final result = await db.query(tableUsers, orderBy: orderBy);
    return result.map((json) => User.fromJson(json)).toList();
  }

  Future<int> update(User user) async {
    final db = await instance.database;

    return db.update(
      tableUsers,
      user.toJson(),
      where: '${UsersFields.id} = ?',
      whereArgs: [user.id]
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableUsers,
      where: '${UsersFields.id} = ?',
      whereArgs: [id]
    );
  }

  Future deleteAllUsers() async {
    final db = await instance.database;

    return await db.delete(
        tableUsers,
        where: '1 = 1'
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

}