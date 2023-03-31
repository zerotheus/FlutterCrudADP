import 'package:flutter/material.dart';
import 'package:flutter_crud_adp/models/professor.dart';
import 'package:provider/provider.dart';
import '../provider/users.dart';

class ProfessorTile extends StatelessWidget {
  final Professor professor;

  ProfessorTile(this.professor);

  @override
  Widget build(BuildContext context) {
    final avatar = professor.avatarUrl == null || professor.avatarUrl.isEmpty
        ? CircleAvatar(
            child: Icon(Icons.person),
          )
        : CircleAvatar(
            backgroundImage: NetworkImage(professor.avatarUrl),
          );
    return ListTile(
      leading: avatar,
      title: Text(professor.nome),
      subtitle: Text(professor.cpf),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed("/CadastroProfessor", arguments: professor);
              },
              icon: Icon(Icons.edit),
              color: Colors.cyanAccent,
            ),
            IconButton(
              onPressed: () {
                Provider.of<Users>(context, listen: false)
                    .removeProfessor(professor);
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
