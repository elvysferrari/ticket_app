class UserModel {

  late int? id;
  late String? nome;
  late String? email;
  late String? telefone;
  late String? foto;

  UserModel({this.id, this.nome, this.email, this.telefone, this.foto});

  Map<String, dynamic> toJson() => {
    "id": id,
    "nome": nome,
    "email": email,
    "telefone": telefone,
    "foto": foto
  };

  UserModel.fromJson(Map<String, dynamic> json){
    id = json["id"] ?? 0;
    nome = json["nome"] ?? "";
    email = json["email"] ?? "";
    telefone = json["telefone"] ?? "";
    foto =json["foto"] ?? "";
  }
}
