import 'package:flutter/material.dart';
import 'package:flutter_crud_adp/components/user_tile.dart';
import 'package:flutter_crud_adp/models/aluno.dart';
import 'package:flutter_crud_adp/provider/users.dart';
import 'package:provider/provider.dart';

class AlunosView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Users alunos = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Alunos"),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/Cadastro");
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
          itemCount: alunos.countAlunos,
          itemBuilder: (context, index) =>
              UserTile(alunos.todosAlunos.elementAt(index))),
    );
  }
}
