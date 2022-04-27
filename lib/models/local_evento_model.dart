class LocalEventoModel{
  late int id;
  late String nome;
  late String endereco;
  late String numero;
  late String bairro;
  late String cidade;
  late String uf;

  LocalEventoModel(this.id, this.nome, this.endereco, this.numero, this.bairro, this.cidade, this.uf);

  Map<String, dynamic> toJson() => {
    "id": id,
    "nome": nome,
    "endereco" : endereco,
    "numero": numero,
    "bairro" : bairro,
    "cidade" : cidade,
    "uf" : uf
  };

  LocalEventoModel.fromJson(Map<String, dynamic> json){
    id = json["id"] ?? 0;
    nome = json["nome"] ?? "";
    endereco =json["endereco"] ?? "";
    numero = json["numero"] ?? "";
    bairro =  json["bairro"] ?? "";
    cidade = json["cidade"] ?? "";
    uf = json["uf"] ?? "";
  }
}