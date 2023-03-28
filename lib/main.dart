import 'package:flutter/material.dart';
import 'package:flutter_crud_adp/views/alunos_view.dart';
import 'package:flutter_crud_adp/views/disciplinas_view.dart';
import 'package:flutter_crud_adp/views/professor_view.dart';
import 'package:flutter_crud_adp/views/tela_inicial_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/Alunos": (context) => AlunosView(),
        "/Professores": (context) => ProfessoresView(),
        "/Disciplinas": (context) => DisciplinasView(),
      },
      home: Telaincialview(),
    );
  }
}
