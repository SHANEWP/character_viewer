import 'package:character_viewer/models/character/character_image_model.dart';

class CharacterModel {
  CharacterImageModel image;
  String text;

  CharacterModel({
    required this.image,
    required this.text,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      text: json['Text'],
      image: CharacterImageModel.fromJson(json['Icon']),
    );
  }
}
