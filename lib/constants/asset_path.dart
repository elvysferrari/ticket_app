final String imageAssetsRoot = "images/";

final String chat_relato = _getImagePath("chat_relato.png");
final String empty_image_profile = _getImagePath("empty_image_profile.png");

String _getImagePath(String fileName){
  return imageAssetsRoot + fileName;
}
