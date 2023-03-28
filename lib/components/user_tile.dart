import 'package:flutter/material.dart';
import 'package:flutter_crud_adp/models/aluno.dart';

import '../data/placeholders_alunos.dart';

class UserTile extends StatelessWidget {
  final Aluno aluno;

  UserTile(this.aluno);

  @override
  Widget build(BuildContext context) {
    final avatar = aluno.avatarUrl == null || aluno.avatarUrl.isEmpty
        ? CircleAvatar(
            child: Icon(Icons.person),
          )
        : CircleAvatar(
            backgroundImage: NetworkImage(aluno.avatarUrl),
          );
    return ListTile(
      leading: avatar,
      title: Text(aluno.nome),
      subtitle: Text(aluno.cpf),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
            IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}
