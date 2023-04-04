import 'package:e_cinemav1/authentification/model/user_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class DatabaseService {
  static Database? _database;
  static const String dbname = 'users_db';

  static const String username = 'username';
  static const String phonenumber = 'phonenumber';
  static const String email = 'email';
  static const String password = 'password';
  // ignore: constant_identifier_names
  static const String Table_user = "user";
  DatabaseService._privateConstructor();

  static final DatabaseService service = DatabaseService._privateConstructor();

  Future<Database> get database async => _database ??= await initDatabase();

  Future<Database> initDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, dbname);
    return await openDatabase(path, version: 1, onCreate: _createdb);
  }

  Future _createdb(Database db, int verison) async {
    await db.execute("CREATE TABLE $Table_user("
        " $username TEXT PRIMARY KEY, "
        " $phonenumber TEXT,"
        " $email TEXT,"
        " $password TEXT"
        ")");
  }

  Future<List<User>> getAllUsers() async {
    Database db = await service.database;
    var users = await db.query(Table_user);
    List<User> list =
        users.isNotEmpty ? users.map((e) => User.fromMap(e)).toList() : [];
    return list;
  }

  Future<User?> getLoginUser(String userEmail, String userPassword) async {
    Database db = await service.database;
    var res = await db.rawQuery("SELECT * FROM $Table_user WHERE "
        "$email = '$userEmail' AND "
        "$password = '$userPassword'");

    if (res.isNotEmpty) {
      return User.fromMap(res.first);
    }
    return null;
  }

  Future<User?> getUsername(String userName) async {
    Database db = await service.database;
    var res = await db.rawQuery("SELECT * FROM $Table_user WHERE "
        "$username = '$userName'");

    if (res.isNotEmpty) {
      return User.fromMap(res.first);
    }
    return null;
  }

  Future<int> saveData(User user) async {
    Database db = await service.database;
    var res = await db.insert(Table_user, user.toMap());
    return res;
  }

  Future<int> deleteUser(String username) async {
    Database db = await service.database;

    return await db
        .delete(Table_user, where: 'username = ?', whereArgs: [username]);
  }

  Future<int> updateUser(User user) async {
    Database db = await service.database;
    return await db.update(Table_user, user.toMap(),
        where: 'username = ?', whereArgs: [user.username]);
  }
}
