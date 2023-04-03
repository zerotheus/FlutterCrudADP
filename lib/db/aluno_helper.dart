import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';
import 'create_table_db.dart';
import 'aluno_model.dart';

class AlunoHelper {
  static Future<int> addAluno(Aluno aluno) async {
    final db = await CreateTable.init();

    return db.insert("Alunos", aluno.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Aluno>> listaAlunos() async {
    final db = await CreateTable.init();
    print("Post create table");
    final maps = await db.query("Alunos");

    return List.generate(maps.length, (index) {
      return Aluno(
          id: int.parse(maps[index]['id'].toString()),
          cpf: maps[index]['cpf'].toString(),
          nome: maps[index]['nome'].toString(),
          avatarUrl: maps[index]['avatarUrl'].toString());
    });
  }

  static Future<int> deletaAluno(int id) async {
    final db = await CreateTable.init();

    int result = await db.delete(
      "Alunos",
      where: "id = ?",
      whereArgs: [id],
    );

    return result;
  }

  static Future<int> updateAluno(int id, Aluno aluno) async {
    final db = await CreateTable.init();
    print(id);
    print(aluno);
    return await db
        .update("Alunos", aluno.toMap(), where: "id = ?", whereArgs: [id]);
  }
}
