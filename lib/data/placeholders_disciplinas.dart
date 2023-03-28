import 'package:flutter_crud_adp/data/placeholders_professores.dart';
import 'package:flutter_crud_adp/models/professor.dart';

import '../models/disciplinas.dart';

const professores = {...placeholderProfessores};

const placeholderDisciplinas = {
  '4': const Disciplina(
      nome: "INF",
      codigo: "000",
      professor: const Professor(
          cpf: "654",
          nome: "aria",
          avatarUrl:
              "https://cdn.pixabay.com/photo/2016/03/31/19/57/avatar-1295404__340.png")),
};
