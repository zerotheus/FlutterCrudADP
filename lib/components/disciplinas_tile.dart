import 'package:flutter/material.dart';
import 'package:flutter_crud_adp/models/disciplinas.dart';
import 'package:provider/provider.dart';

import '../provider/users.dart';

class DisciplinaTile extends StatelessWidget {
  final Disciplina disciplina;

  DisciplinaTile(this.disciplina);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(disciplina.nome),
      subtitle: Text(disciplina.codigo),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed("/Cadastrodisciplina", arguments: disciplina);
              },
              icon: Icon(Icons.edit),
              color: Colors.cyanAccent,
            ),
            IconButton(
              onPressed: () {
                Provider.of<Users>(context, listen: false)
                    .removeDisciplina(disciplina);
              },
              icon: Icon(Icons.delete),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
