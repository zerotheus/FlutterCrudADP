import 'package:flutter_crud_adp/db/professor_model.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';
import 'create_table_db.dart';

class ProfessorHelper {
  static Future<int> addProfessor(Professor professor) async {
    final db = await CreateTable.init();

    return db.insert("Professores", professor.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Professor>> listaProfessores() async {
    final db = await CreateTable.init();
    print("Post professores create table");
    final maps = await db.query("Professores");

    return List.generate(maps.length, (index) {
      return Professor(
          id: int.parse(maps[index]['id'].toString()),
          cpf: maps[index]['cpf'].toString(),
          nome: maps[index]['nome'].toString(),
          avatarUrl: maps[index]['avatarUrl'].toString());
    });
  }

  static Future<int> deletaProfessor(int id) async {
    final db = await CreateTable.init();

    int result = await db.delete(
      "Professores",
      where: "id = ?",
      whereArgs: [id],
    );

    return result;
  }

  static Future<int> updateProfessor(int id, Professor professor) async {
    final db = await CreateTable.init();
    print(id);
    print(professor);
    return await db.update("Professores", professor.toMap(),
        where: "id = ?", whereArgs: [id]);
  }
}
