class Disciplina {
  final int? id;
  final String codigo;
  final String nome;
  final int? professorId;

  Disciplina(
      {this.id, this.professorId, required this.codigo, required this.nome});
}
