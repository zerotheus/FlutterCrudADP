import 'package:flutter/material.dart';
import 'package:flutter_crud_adp/components/disciplinas_tile.dart';
import 'package:flutter_crud_adp/db/disciplina_helper.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DisciplinasView extends StatefulWidget {
  @override
  State<DisciplinasView> createState() => _DisciplinasViewState();
}

class _DisciplinasViewState extends State<DisciplinasView> {
  Widget loadDisciplinas() {
    return FutureBuilder(
        future: DisciplinaHelper.listaDisciplinas(),
        builder:
            (BuildContext context, AsyncSnapshot<List<dynamic>?> disciplinas) {
          if (disciplinas.hasData) {
            print("tem disciplinas");
            return ExibeDisciplinas(disciplinas.data!);
          }
          print(disciplinas.error);
          return const Center(
            child: SpinKitWave(
              color: Colors.blue,
              size: 60,
            ),
          );
        });
  }

  Widget ExibeDisciplinas(List<dynamic> disciplinas) {
    return ListView.builder(
      itemCount: disciplinas.length,
      itemBuilder: (context, index) {
        return DisciplinaTile(disciplinas.elementAt(index));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Disciplinas"),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/CadastroDisciplina');
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: loadDisciplinas(),
    );
  }
}
