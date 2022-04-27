class UserModel {

  late String? id;
  late String? name;
  late String? email;
  late String? urlImage;
  late List<dynamic> eventoFavoritos;

  UserModel({this.id, this.name, this.email, this.urlImage, required this.eventoFavoritos});

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "urlImage": urlImage,
    "postsFavoritos" : eventoFavoritos
  };

  UserModel.fromMap(Map<String, dynamic> json){
    id = json["id"] ?? "";
    name = json["name"] ?? "";
    email = json["email"] ?? "";
    urlImage =json["urlImage"] ?? "";
    eventoFavoritos = json["postsFavoritos"] ?? [];
  }
}
