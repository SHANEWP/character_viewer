import 'package:character_viewer/models/character/character_model.dart';

class CharacterListModel {
  List<CharacterModel> characters;

  CharacterListModel({required this.characters});

  factory CharacterListModel.fromJson(Map<String, dynamic> json) {
    var list = json['RelatedTopics'] as List;
    List<CharacterModel> characterList =
        list.map((character) => CharacterModel.fromJson(character)).toList();
    return CharacterListModel(
      characters: characterList,
    );
  }
}
