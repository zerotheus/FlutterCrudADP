class Professor {
  final int? id;
  final String cpf;
  final String nome;
  final String avatarUrl;

  Professor(
      {this.id,
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
