import 'package:flutter/material.dart';
import 'package:flutter_crud_adp/db/disciplina_helper.dart';
import 'package:flutter_crud_adp/db/disciplina_model.dart';
import '../db/aluno_model.dart';

class DisciplinaForm extends StatefulWidget {
  @override
  State<DisciplinaForm> createState() => _DisciplinaFormState();
}

class _DisciplinaFormState extends State<DisciplinaForm> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  bool _isEditMode = false;

  void _loadDisciplinasData(Disciplina disciplina) {
    _formData['codigo'] = disciplina.codigo;
    _formData['nome'] = disciplina.nome;
  }

  Widget build(BuildContext context) {
    final Disciplina? disciplina =
        ModalRoute.of(context)?.settings.arguments as Disciplina?;
    if (disciplina != null) {
      _loadDisciplinasData(disciplina);
      _isEditMode = true;
    }

    return Scaffold(
      appBar:
          AppBar(title: const Text("Cadastro Disciplinas"), actions: <Widget>[
        IconButton(
            onPressed: () {
              _form.currentState?.save();
              if (_isEditMode) {
                /*Disciplina update*/
              } else {
                DisciplinaHelper.addDisciplina(Disciplina(
                  codigo: _formData['codigo']!,
                  nome: _formData['nome']!,
                ));
              }
              Navigator.of(context).pop();
              Navigator.popAndPushNamed(context, '/Disciplinas');
              setState(() {});
            },
            icon: const Icon(Icons.save))
      ]),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['codigo'],
                decoration: const InputDecoration(labelText: "codigo"),
                onSaved: (value) => {
                  _formData['codigo'] = value!,
                },
              ),
              TextFormField(
                initialValue: _formData['nome'],
                decoration: const InputDecoration(labelText: "nome"),
                onSaved: (value) => {
                  _formData['nome'] = value!,
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
