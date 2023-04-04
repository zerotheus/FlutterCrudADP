import 'package:sqflite/sqflite.dart'; //sqflite package
import 'package:path_provider/path_provider.dart'; //path_provider package
import 'package:path/path.dart'; //used to join paths
import 'package:flutter_crud_adp/db/aluno_model.dart'; //import model class
import 'dart:io';
import 'dart:async';

class CreateTable {
  static Future<Database> init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, "Alunos.db");
    print("create table");
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute("""
          CREATE TABLE IF NOT EXISTS Alunos(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nome TEXT,
          cpf TEXT,
          avatarUrl TEXT)""");
      db.execute("""
          CREATE TABLE IF NOT EXISTS Professores(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nome TEXT,
          cpf TEXT,
          avatarUrl TEXT)""");
    });
  }
}
