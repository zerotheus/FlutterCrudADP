import 'package:flutter/material.dart';

class DisciplinasView extends StatefulWidget {
  @override
  State<DisciplinasView> createState() => _DisciplinasViewState();
}

class _DisciplinasViewState extends State<DisciplinasView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Disciplinas"),
      ),
    );
  }
}
