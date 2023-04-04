import 'package:flutter/material.dart';
import 'package:flutter_crud_adp/db/professor_helper.dart';
import '../db/professor_model.dart';

class ProfessorForm extends StatefulWidget {
  @override
  State<ProfessorForm> createState() => _ProfessorFormState();
}

class _ProfessorFormState extends State<ProfessorForm> {
  @override
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  bool _isEditMode = false;

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
              if (_isEditMode) {
                ProfessorHelper.updateProfessor(
                    professor!.id!,
                    Professor(
                        id: professor.id,
                        cpf: _formData['cpf']!,
                        nome: _formData['nome']!,
                        avatarUrl: _formData['avatarUrl']!));
              } else {
                ProfessorHelper.addProfessor(Professor(
                    cpf: _formData['cpf']!,
                    nome: _formData['nome']!,
                    avatarUrl: _formData['avatarUrl']!));
              }
              Navigator.of(context).pop();
              Navigator.popAndPushNamed(context, '/Professores');
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
                initialValue: _formData['nome'],
                decoration: InputDecoration(labelText: "nome"),
                onSaved: (value) => {
                  _formData['nome'] = value!,
                },
              ),
              TextFormField(
                initialValue: _formData['cpf'],
                decoration: InputDecoration(labelText: "cpf"),
                onSaved: (value) => {
                  _formData['cpf'] = value!,
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
