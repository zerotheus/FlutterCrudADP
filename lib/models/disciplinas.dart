import 'package:flutter_crud_adp/models/professor.dart';

class Disciplina {
  final String nome;
  final String codigo;
  final Professor professor;

  const Disciplina(
      {required this.nome, required this.codigo, required this.professor});
}
