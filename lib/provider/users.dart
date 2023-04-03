import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_crud_adp/data/placeholders_disciplinas.dart';
import 'package:flutter_crud_adp/data/placeholders_professores.dart';
import 'package:flutter_crud_adp/models/disciplinas.dart';
import 'package:flutter_crud_adp/models/professor.dart';
import '../db/aluno_helper.dart';
import '../db/aluno_model.dart';

class Users with ChangeNotifier {
  final Map<String, Professor> _professores = {...placeholderProfessores};
  final Map<String, Disciplina> _disciplinas = {...placeholderDisciplinas};

  List<Professor> get todosProfessores {
    return [..._professores.values];
  }

  int get countProfessores {
    return _professores.length;
  }

  Professor professorByIndex(int index) {
    return _professores.values.elementAt(index);
  }

  void putProfessor(Professor professor) {
    if (professor == null) {
      return;
    }
    if (professor.cpf != null &&
        professor.cpf.trim().isNotEmpty &&
        _professores.containsKey(professor.cpf)) {
      _professores.update(
          professor.cpf,
          (_) => Professor(
              cpf: professor.cpf,
              nome: professor.nome,
              avatarUrl: professor.avatarUrl));
      notifyListeners();
      return;
    }
    _professores.putIfAbsent(
        '${professor.cpf}',
        () => Professor(
            cpf: professor.cpf,
            nome: professor.nome,
            avatarUrl: professor.avatarUrl));

    notifyListeners();
  }

  void removeProfessor(Professor professor) {
    if (professor != null && professor.cpf != null) {
      _professores.remove(professor.cpf);
      notifyListeners();
    }
  }

  List<Disciplina> get todasDisciplinas {
    return [..._disciplinas.values];
  }

  int get countDisciplinas {
    return _disciplinas.length;
  }

  Disciplina DisciplinaByindex(int index) {
    return _disciplinas.values.elementAt(index);
  }

  void putDisciplinas(Disciplina disciplina) {
    if (disciplina == null) {
      return;
    }
    if (disciplina.codigo != null && disciplina.codigo.trim().isNotEmpty) {
      _disciplinas.update(
          disciplina.codigo,
          (value) => Disciplina(
              nome: disciplina.nome,
              codigo: disciplina.codigo,
              professor: disciplina.professor));
      notifyListeners();
      return;
    }
    _disciplinas.putIfAbsent(
        '${disciplina.codigo}',
        () => Disciplina(
            nome: disciplina.nome,
            codigo: disciplina.codigo,
            professor: disciplina.professor));
    notifyListeners();
  }

  void removeDisciplina(Disciplina disciplina) {
    if (disciplina != null && disciplina.codigo != null) {
      _disciplinas.remove(disciplina.codigo);
      notifyListeners();
    }
  }
}
