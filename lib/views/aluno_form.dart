import 'package:flutter/material.dart';
import 'package:flutter_crud_adp/db/aluno_helper.dart';
import 'package:provider/provider.dart';
import '../db/aluno_model.dart';

class AlunoForm extends StatefulWidget {
  @override
  State<AlunoForm> createState() => _AlunoFormState();
}

class _AlunoFormState extends State<AlunoForm> {
  @override
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  bool _isEditMode = false;

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
      _isEditMode = true;
    }

    return Scaffold(
      appBar: AppBar(title: Text("Cadastro Aluno"), actions: <Widget>[
        IconButton(
            onPressed: () {
              _form.currentState?.save();
              if (_isEditMode) {
                AlunoHelper.updateAluno(
                    aluno!.id!,
                    Aluno(
                        id: aluno.id,
                        cpf: _formData['cpf']!,
                        nome: _formData['nome']!,
                        avatarUrl: _formData['avatarUrl']!));
              } else {
                AlunoHelper.addAluno(Aluno(
                    cpf: _formData['cpf']!,
                    nome: _formData['nome']!,
                    avatarUrl: _formData['avatarUrl']!));
              }
              Navigator.popAndPushNamed(context, '/Alunos');
              setState(() {});
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
