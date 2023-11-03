class CharacterImageModel {
  String url;

  CharacterImageModel({
    required this.url,
  });

  factory CharacterImageModel.fromJson(Map<String, dynamic> json) {
    return CharacterImageModel(
      url: json['URL'],
    );
  }
}
