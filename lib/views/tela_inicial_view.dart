import 'package:flutter/material.dart';

// Ndocs, tela inicial, para fazer a lista clicavel basta um listView, e um inkWell, ele pede a ação do ontap, e apos isso pode ser adicionado uma child para ser inserido o texto
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
            return InkWell(
              onTap: () {
                print(index);
                print(opcao);
                Navigator.pushNamed(context, '/${opcao}');
              },
              child: ListTile(title: Text(opcao)),
            );
          }),
    );
  }
}
