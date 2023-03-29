import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_crud_adp/data/placeholders_alunos.dart';
import 'package:flutter_crud_adp/data/placeholders_disciplinas.dart';
import 'package:flutter_crud_adp/data/placeholders_professores.dart';
import 'package:flutter_crud_adp/models/aluno.dart';
import 'package:flutter_crud_adp/models/disciplinas.dart';
import 'package:flutter_crud_adp/models/professor.dart';

class Users with ChangeNotifier {
  final Map<String, Aluno> _alunos = {...placeholdersAlunos};
  final Map<String, Professor> _professores = {...placeholderProfessores};
  final Map<String, Disciplina> _disciplinas = {...placeholderDisciplinas};

  List<Aluno> get todosAlunos {
    return [..._alunos.values];
  }

  int get countAlunos {
    return _alunos.length;
  }

  Aluno byindex(int index) {
    return _alunos.values.elementAt(index);
  }

  void putAluno(Aluno aluno) {
    if (aluno == null) {
      return;
    }
    if (aluno.cpf != null &&
        aluno.cpf.trim().isNotEmpty &&
        _alunos.containsKey(aluno.cpf)) {
      _alunos.update(
          aluno.cpf,
          (_) => Aluno(
              cpf: aluno.cpf,
              nome: aluno.nome + " alterado",
              avatarUrl: aluno.avatarUrl));
      notifyListeners();
      return;
    }
    _alunos.putIfAbsent(
        '${aluno.cpf}',
        () => Aluno(
            cpf: aluno.cpf, nome: aluno.nome, avatarUrl: aluno.avatarUrl));

    notifyListeners();
  }
}
