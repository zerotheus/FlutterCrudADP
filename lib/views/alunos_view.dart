import 'package:flutter/material.dart';
import 'package:flutter_crud_adp/components/user_tile.dart';
import 'package:flutter_crud_adp/db/aluno_helper.dart';
import 'package:flutter_crud_adp/models/aluno.dart';
import 'package:flutter_crud_adp/provider/users.dart';
import 'package:provider/provider.dart';

class _AlunosView extends State<AlunosView> {
  @override
  Widget build(BuildContext context) {
    final Users alunos = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Alunos"),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/CadastroAluno");
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

class AlunosView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AlunosView();
}
