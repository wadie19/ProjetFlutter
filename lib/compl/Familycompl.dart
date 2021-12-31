import 'package:login_with_signup/Model/FamilyModel.dart';
import 'package:login_with_signup/DatabaseHandler/DbHelper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class Family {
  static Future<bool> add(FamilyModel family) async {
    Database db = await DbHelper.getDatabase();
    List<Map> familyy = await db
        .query("FAMILY", where: "familyname = ?", whereArgs: [family.familyname]);
    if (familyy.isEmpty) {
      print(family.toMap());
      await db.insert("FAMILY", family.toMap());
      return true;
    }
    return false;
  }

  static Future<List<FamilyModel>> getAllFamily() async {
    Database db = await DbHelper.getDatabase();
    List<Map<String, Object>> mapFamilly = await db.query("FAMILY");
    List<FamilyModel> allFamilly = [];
    mapFamilly.forEach((element) => allFamilly.add(FamilyModel.fromMap(element)));
    return allFamilly;
  }
}
