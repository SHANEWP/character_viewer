// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:character_viewer/utils/colors.dart';
import 'package:character_viewer/config.dart';
import 'package:character_viewer/utils/fonts.dart';
import 'package:flutter/material.dart';

import 'package:character_viewer/models/character/character_model.dart';

class DetailsDescription extends StatelessWidget {
  final CharacterModel character;

  const DetailsDescription({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name = character.text.split('-').first;
    String description =
        character.text.substring(name.length + 2, character.text.length);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: fgColor[Config.propertyKey],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        description,
        style: TextStyle(
          fontSize: characterDescriptionFontSize,
          color: textColor[Config.propertyKey],
          height: 1.25,
        ),
      ),
    );
  }
}
