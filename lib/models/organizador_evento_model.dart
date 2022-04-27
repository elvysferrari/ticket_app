class OrganizadorEventoModel{
  late int id;
  late String nome;

  OrganizadorEventoModel(this.id, this.nome);

  Map<String, dynamic> toJson() => {
    "id": id,
    "nome": nome
  };

  OrganizadorEventoModel.fromMap(Map<String, dynamic> json){
    id = json["id"] ?? 0;
    nome = json["nome"] ?? "";
  }
}