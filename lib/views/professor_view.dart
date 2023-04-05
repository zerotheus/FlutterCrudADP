import 'package:flutter/material.dart';
import 'package:flutter_crud_adp/db/professor_helper.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../components/professor_tile.dart';

class ProfessoresView extends StatefulWidget {
  @override
  State<ProfessoresView> createState() => _ProfessoresViewState();
}

Widget loadProfessores() {
  return FutureBuilder(
      future: ProfessorHelper.listaProfessores(),
      builder:
          (BuildContext context, AsyncSnapshot<List<dynamic>?> professores) {
        if (professores.hasData) {
          print("has data");
          return ExibeProfessores(professores.data!);
        }
        return const Center(
          child: SpinKitWave(
            color: Colors.blue,
            size: 60,
          ),
        );
      });
}

Widget ExibeProfessores(List<dynamic> professores) {
  return ListView.builder(
    itemCount: professores.length,
    itemBuilder: (context, index) {
      return ProfessorTile(professores.elementAt(index));
    },
  );
}

class _ProfessoresViewState extends State<ProfessoresView> {
  @override
  Widget build(BuildContext context) {
    //final professores = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Professores"),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/CadastroProfessor");
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: loadProfessores(),
    );
  }
}
