import 'package:flutter/material.dart';
import 'package:flutter_crud_adp/models/professor.dart';
import 'package:provider/provider.dart';

import '../models/professor.dart';
import '../provider/users.dart';

class professorForm extends StatelessWidget {
  @override
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadProfessorData(Professor professor) {
    _formData['cpf'] = professor.cpf;
    _formData['nome'] = professor.nome;
    _formData['avatarUrl'] = professor.avatarUrl;
  }

  Widget build(BuildContext context) {
    final Professor? professor =
        ModalRoute.of(context)?.settings.arguments as Professor?;
    if (professor != null) {
      print('nao era nulo');
      _loadProfessorData(professor);
    }

    return Scaffold(
      appBar: AppBar(title: Text("Cadastro Professor"), actions: <Widget>[
        IconButton(
            onPressed: () {
              _form.currentState?.save();
              Provider.of<Users>(context, listen: false).putProfessor(Professor(
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
                initialValue: _formData['cpf'],
                decoration: InputDecoration(labelText: "cpf"),
                onSaved: (value) => {
                  _formData['cpf'] = value!,
                },
              ),
              TextFormField(
                initialValue: _formData['nome'],
                decoration: InputDecoration(labelText: "nome"),
                onSaved: (value) => {
                  _formData['nome'] = value!,
                },
              ),
              TextFormField(
                initialValue: _formData['avatarUrl'],
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
