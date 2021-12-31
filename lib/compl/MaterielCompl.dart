import 'package:login_with_signup/Model/materielModel.dart';
import 'package:login_with_signup/DatabaseHandler/DbHelper.dart';
import 'package:sqflite/sqflite.dart';

class MaterielCmp {
  static Future<bool> add(MaterielModel mat) async {
    Database db = await DbHelper.getDatabase();
    List<Map> material = await db.query("Materiel",
        where: "nomMateriel=? and nomFamily=?",
        whereArgs: [
          mat.nomMateriel,
          mat.quantite,
          mat.dateAcqui.microsecondsSinceEpoch,
          mat.nomFamily
        ]);
    if (material.isEmpty) {
      await db.insert("Materiel", mat.toMap());
      return true;
    }
    return false;
  }

  static Future<List<MaterielModel>> getAllMaterial() async {
    Database db = await DbHelper.getDatabase();
    List<Map<String, Object>> mapMaterial = await db.query("Materiel");
    List<MaterielModel> allMaterial = [];
    mapMaterial
        .forEach((element) => allMaterial.add(MaterielModel.fromMap(element)));
    return allMaterial;
  }

  static Future<List<MaterielModel>> getMaterialByNomF(String nomFamily) async {
    Database db = await DbHelper.getDatabase();
    List<Map<String, dynamic>> materials =
    await db.query("Materiel", where: "nomFamily = ?", whereArgs: [nomFamily]);
    List<MaterielModel> allMaterial = [];
    materials.forEach((element) => allMaterial.add(MaterielModel.fromMap(element)));
    return allMaterial;
  }

}
