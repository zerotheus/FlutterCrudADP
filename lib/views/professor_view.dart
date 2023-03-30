import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/professor_tile.dart';
import '../provider/users.dart';

class ProfessoresView extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    final Users professores = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Disciplinas"),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/CadastroAluno");
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
          itemCount: professores.countProfessores,
          itemBuilder: (context, index) =>
              ProfessorTile(professores.todosProfessores.elementAt(index))),
    );
  }
}
