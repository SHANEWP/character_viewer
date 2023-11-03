// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:character_viewer/utils/colors.dart';
import 'package:character_viewer/config.dart';
import 'package:flutter/material.dart';

import 'package:character_viewer/models/character/character_model.dart';

class DetailsImage extends StatelessWidget {
  final CharacterModel character;

  const DetailsImage({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image(
        height: 250,
        image: (character.image.url.isNotEmpty)
            ? Image.network(
                'https://duckduckgo.com${character.image.url}',
              ).image
            : Image.asset(
                Config.placeholderImage,
              ).image,
        fit: BoxFit.cover,
      ),
    );
  }
}
