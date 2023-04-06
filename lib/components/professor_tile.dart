import 'package:flutter/material.dart';
import 'package:flutter_crud_adp/db/professor_helper.dart';
import '../db/professor_model.dart';

class ProfessorTile extends StatelessWidget {
  final Professor professor;

  ProfessorTile(this.professor);

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    final avatar = professor.avatarUrl == null || professor.avatarUrl.isEmpty
        ? const CircleAvatar(
            child: Icon(Icons.person),
          )
        : CircleAvatar(
            backgroundImage: NetworkImage(professor.avatarUrl),
          );
    return ListTile(
      leading: avatar,
      title: Text(professor.nome),
      subtitle: Text(professor.cpf),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed("/CadastroProfessor", arguments: professor);
              },
              icon: const Icon(Icons.edit),
              color: Colors.cyanAccent,
            ),
            IconButton(
              onPressed: () {
                ProfessorHelper.deletaProfessor(professor.id!);
                Navigator.pop(context);
                Navigator.pushNamed(context, "/Professores");
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
