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
              cpf: aluno.cpf, nome: aluno.nome, avatarUrl: aluno.avatarUrl));
      notifyListeners();
      return;
    }
    _alunos.putIfAbsent(
        '${aluno.cpf}',
        () => Aluno(
            cpf: aluno.cpf, nome: aluno.nome, avatarUrl: aluno.avatarUrl));

    notifyListeners();
  }

  void removeAluno(Aluno aluno) {
    if (aluno != null && aluno.cpf != null) {
      _alunos.remove(aluno.cpf);
      notifyListeners();
    }
  }

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
      _alunos.remove(disciplina.codigo);
      notifyListeners();
    }
  }
}
