import 'package:flutter/material.dart';
import 'package:flutter_crud_adp/db/disciplina_helper.dart';
import '../db/disciplina_model.dart';

class DisciplinaTile extends StatelessWidget {
  final Disciplina disciplina;

  DisciplinaTile(this.disciplina);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(disciplina.nome),
      subtitle: Text(disciplina.codigo),
      trailing: SizedBox(
        width: 194,
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person_add),
              color: Colors.yellow,
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.book),
                color: Colors.green),
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed("/CadastroDisciplina", arguments: disciplina);
              },
              icon: const Icon(Icons.edit),
              color: Colors.cyanAccent,
            ),
            IconButton(
              onPressed: () {
                DisciplinaHelper.deletaDisciplina(disciplina.id!);
                Navigator.pop(context);
                Navigator.pushNamed(context, "/Disciplinas");
              },
              icon: const Icon(Icons.delete),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
