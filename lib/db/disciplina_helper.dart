import 'package:sqflite/sqlite_api.dart';
import 'create_table_db.dart';
import 'disciplina_model.dart';

class DisciplinaHelper {
  static Future<int> addDisciplina(Disciplina disciplina) async {
    final db = await CreateTable.init();

    return db.insert("Disciplinas", disciplina.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Disciplina>> listaDisciplinas() async {
    final db = await CreateTable.init();
    print("Lista disciplinas");
    final maps = await db.query("Disciplinas");

    return List.generate(maps.length, (index) {
      return Disciplina(
        id: int.parse(maps[index]['id'].toString()),
        codigo: maps[index]['codigo'].toString(),
        nome: maps[index]['nome']
            .toString(), /*prof_id: int.parse(maps[index]['prof_id'].toString())*/
      );
    });
  }

  static Future<int> deletaDisciplina(int id) async {
    final db = await CreateTable.init();

    int result = await db.delete(
      "Disciplinas",
      where: "id = ?",
      whereArgs: [id],
    );

    return result;
  }

  static Future<int> updateDisciplina(int id, Disciplina disciplina) async {
    final db = await CreateTable.init();
    print(id);
    print(disciplina);
    return await db.update("Disciplinas", disciplina.toMap(),
        where: "id = ?", whereArgs: [id]);
  }
}
