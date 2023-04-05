class Disciplina {
  final int? id;
  final String codigo;
  final String nome;
  final int? prof_id;

  Disciplina({this.id, this.prof_id, required this.codigo, required this.nome});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "codigo": codigo,
      "nome": nome,
      "prof_id": prof_id,
    };
  }
}
