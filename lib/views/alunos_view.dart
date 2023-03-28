import 'package:flutter/material.dart';
import 'package:flutter_crud_adp/components/user_tile.dart';
import 'package:flutter_crud_adp/data/placeholders_alunos.dart';

class AlunosView extends StatelessWidget {
  final alunos = {...placeholdersAlunos};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alunos"),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
          itemCount: alunos.length,
          itemBuilder: (context, index) =>
              UserTile(alunos.values.elementAt(index))),
    );
  }
}
