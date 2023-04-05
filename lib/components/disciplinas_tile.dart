import 'package:flutter/material.dart';
import '../db/disciplina_model.dart';

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
              icon: const Icon(Icons.edit),
              color: Colors.cyanAccent,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
