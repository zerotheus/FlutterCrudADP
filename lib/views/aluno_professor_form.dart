import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/aluno.dart';
import '../provider/users.dart';

class AlunoProfessorForm extends StatelessWidget {
  @override
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cadastro"), actions: <Widget>[
        IconButton(
            onPressed: () {
              _form.currentState?.save();
              Provider.of<Users>(context, listen: false).putAluno(Aluno(
                  cpf: _formData['cpf']!,
                  nome: _formData['nome']!,
                  avatarUrl: _formData['avatarUrl']!));
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.save))
      ]),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: "cpf"),
                onSaved: (value) => {
                  _formData['cpf'] = value!,
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "nome"),
                onSaved: (value) => {
                  _formData['nome'] = value!,
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "AvatarUrl"),
                onSaved: (value) => {
                  _formData['avatarUrl'] = value!,
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
