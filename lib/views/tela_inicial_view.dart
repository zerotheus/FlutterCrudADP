import 'package:flutter/material.dart';

class Telaincialview extends StatelessWidget {
  final opcoes = ['Alunos', 'Professores', 'Disciplinas'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Inicial"),
      ),
      body: ListView.builder(
          itemCount: opcoes.length,
          itemBuilder: (context, index) {
            final opcao = opcoes[index];
            return ListTile(
              title: Text(opcao),
            );
          }),
    );
  }
}
