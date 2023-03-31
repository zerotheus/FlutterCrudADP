class Aluno {
  final int id;
  final String cpf;
  final String nome;
  final String avatarUrl;

  Aluno(
      {required this.id,
      required this.cpf,
      required this.nome,
      required this.avatarUrl});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "cpf": cpf,
      "nome": nome,
      "avatarUrl": avatarUrl,
    };
  }
}
