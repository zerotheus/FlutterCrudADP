import 'package:flutter/material.dart';
import 'package:flutter_crud_adp/components/user_tile.dart';
import 'package:flutter_crud_adp/db/aluno_helper.dart';
import 'package:flutter_crud_adp/provider/users.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class _AlunosView extends State<AlunosView> {
  Widget loadAlunos() {
    return FutureBuilder(
        future: AlunoHelper.listaAlunos(),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>?> alunos) {
          if (alunos.hasData) {
            print("has data");
            return ExibeAlunos(alunos.data!);
          }
          //print(alunos.hasData);
          print(alunos.error);
          return const Center(
            child: SpinKitWave(
              color: Colors.blue,
              size: 60,
            ),
          );
        });
  }

  Widget ExibeAlunos(List<dynamic> alunos) {
    return ListView.builder(
      itemCount: alunos.length,
      itemBuilder: (context, index) {
        return UserTile(alunos.elementAt(index));
      },
    );
  }

  Widget build(BuildContext context) {
    final Users alunos = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Alunos"),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/CadastroAluno");
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: loadAlunos(),
    );
  }
}

class AlunosView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AlunosView();
}
