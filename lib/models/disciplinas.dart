import 'package:flutter_crud_adp/models/professor.dart';

class Disciplina {
  String nome;
  String codigo;
  Professor? professor;

  Disciplina(
      {required this.nome, required this.codigo, required this.professor});
}
