import 'package:login_with_signup/Model/UserModel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

class DbHelper {
  static Database _db;

  static const String DB_Name = 'gstock.db';
  static const String Table_User = 'user';
  static const int Version = 1;

  static const String C_UserID = 'user_id';
  static const String C_UserName = 'user_name';
  static const String C_Email = 'email';
  static const String C_Password = 'password';

  static Future<Database> getDatabase() async {
    return _db ??= await initDb();
  }
  /*Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }*/

  static Future<Database> initDb() async {
    String documentsDirectory = await getDatabasesPath();
    String path = join(documentsDirectory, DB_Name);
    var db = await openDatabase(path, version: Version, onCreate: _onCreate);
    return db;
  }

  static Future<Database> _onCreate(Database db, int intVersion) async {
    await db.execute("CREATE TABLE $Table_User ("
        " $C_UserID TEXT, "
        " $C_UserName TEXT, "
        " $C_Email TEXT,"
        " $C_Password TEXT, "
        " PRIMARY KEY ($C_UserID)"
        ")");
    await db.execute('''CREATE TABLE FAMILY (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      familyname TEXT NOT NULL
      )
      ''');
    await db.execute('''CREATE TABLE MATERIEL (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nomMateriel TEXT NOT NULL,
      quantite INTEGER  NOT NULL,
      dateAcquisition INTEGER,
      dateRetour INTEGER,
      nomFamily TEXT NOT NULL,
      FOREIGN KEY(nomFamily) REFERENCES FAMILY(familyname)
      )
      ''');

  }

  Future<int> saveData(UserModel user) async {
    var dbClient = await getDatabase();
    var res = await dbClient.insert(Table_User, user.toMap());
    return res;
  }

  Future<UserModel> getLoginUser(String userId, String password) async {
    var dbClient = await getDatabase();
    var res = await dbClient.rawQuery("SELECT * FROM $Table_User WHERE "
        "$C_UserID = '$userId' AND "
        "$C_Password = '$password'");

    if (res.length > 0) {
      return UserModel.fromMap(res.first);
    }

    return null;
  }

  Future<int> updateUser(UserModel user) async {
    var dbClient = await getDatabase();
    var res = await dbClient.update(Table_User, user.toMap(),
        where: '$C_UserID = ?', whereArgs: [user.user_id]);
    return res;
  }

  Future<int> deleteUser(String user_id) async {
    var dbClient = await getDatabase();
    var res = await dbClient
        .delete(Table_User, where: '$C_UserID = ?', whereArgs: [user_id]);
    return res;
  }
}
