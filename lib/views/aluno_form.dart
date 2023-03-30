import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/aluno.dart';
import '../provider/users.dart';

class AlunoForm extends StatelessWidget {
  @override
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadAlunoData(Aluno aluno) {
    _formData['cpf'] = aluno.cpf;
    _formData['nome'] = aluno.nome;
    _formData['avatarUrl'] = aluno.avatarUrl;
  }

  Widget build(BuildContext context) {
    final Aluno? aluno = ModalRoute.of(context)?.settings.arguments as Aluno?;
    if (aluno != null) {
      print('nao era nulo');
      _loadAlunoData(aluno);
    }

    return Scaffold(
      appBar: AppBar(title: Text("Cadastro Aluno"), actions: <Widget>[
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
