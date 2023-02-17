
import 'package:e_cinemav1/authentification/model/user_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io';

class DatabaseService{
  String dbname = 'users_db';
  String tablename = 'users_table';
  String id = 'id';
  String username = 'username';
  String phonenumber = 'phonenumber';
  String email = 'email';
  String password = 'password';

  DatabaseService._privateConstructor();

  static final DatabaseService service = DatabaseService._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database??= await initDatabase();

  Future<Database> initDatabase() async{
    var directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path,dbname);
    return await openDatabase(path,version: 1,onCreate: _createdb);
  }

Future _createdb(Database db, int verison) async{
  await db.execute("CREATE TABLE $tablename($id INTEGER PRIMARY KEY, $username TEXT, $phonenumber TEXT, $email TEXT, $password TEXT)");
}

Future<List<User>> getAllUsers() async{
  Database db = await service.database;
  var users = await db.query(tablename);
  List<User> list = users.isNotEmpty? users.map((e) => User.fromMap(e)).toList(): [];
  return list;
}

Future<int> insertUser(User user) async{
  Database db = await service.database;
  return await db.insert(tablename, user.toMap());
}

Future<int> deleteUser(String username) async{
  Database db = await service.database;
 
  return await db.delete(tablename, where: 'username = ?',whereArgs: [username]);
}

Future<int> updateUser(User user) async{
  Database db = await service.database;
  return await db.update(tablename, user.toMap(), where: 'username = ?', whereArgs: [user.username]);
}
}