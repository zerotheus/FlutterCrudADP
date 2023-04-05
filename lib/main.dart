import 'package:flutter/material.dart';
import 'package:flutter_crud_adp/provider/users.dart';
import 'package:flutter_crud_adp/views/alunos_view.dart';
import 'package:flutter_crud_adp/views/disciplina_form.dart';
import 'package:flutter_crud_adp/views/disciplinas_view.dart';
import 'package:flutter_crud_adp/views/professor_form.dart';
import 'package:flutter_crud_adp/views/professor_view.dart';
import 'package:flutter_crud_adp/views/tela_inicial_view.dart';
import 'package:flutter_crud_adp/views/aluno_form.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Users()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: {
            "/Alunos": (context) => AlunosView(),
            "/Professores": (context) => ProfessoresView(),
            "/Disciplinas": (context) => DisciplinasView(),
            "/CadastroAluno": (_) => AlunoForm(),
            "/CadastroProfessor": (_) => ProfessorForm(),
            "/CadastroDisciplina": (_) => DisciplinaForm(),
          },
          home: Telaincialview(),
        ));
  }
}
