import 'package:flutter_crud_adp/models/aluno.dart';
import 'package:flutter_crud_adp/models/disciplinas.dart';
import 'package:flutter_crud_adp/models/professor.dart';

const placeholders = {
  '1': const Aluno(
      cpf: "067",
      nome: "scar",
      avatarUrl:
          "https://cdn.pixabay.com/photo/2016/03/31/19/57/avatar-1295404__340.png"),
  '2': const Aluno(
      cpf: "795",
      nome: "zero",
      avatarUrl:
          "https://cdn.pixabay.com/photo/2016/03/31/19/56/avatar-1295397__340.png"),
  '3': const Professor(
      cpf: "760",
      nome: "Ari",
      avatarUrl:
          "https://cdn.pixabay.com/photo/2017/01/10/03/54/avatar-1968236__340.png"),
  '4': const Disciplina(
      nome: "INF",
      codigo: "000",
      professor: const Professor(
          cpf: "654",
          nome: "aria",
          avatarUrl:
              "https://cdn.pixabay.com/photo/2016/03/31/19/57/avatar-1295404__340.png")),
};
