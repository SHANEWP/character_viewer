// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:character_viewer/config.dart';
import 'package:flutter/material.dart';

import 'package:character_viewer/models/character/character_model.dart';
import 'package:character_viewer/utils/colors.dart';
import 'package:character_viewer/utils/fonts.dart';

class DetailsName extends StatelessWidget {
  final CharacterModel character;

  const DetailsName({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name = character.text.split('-').first;
    String title = name.split('(').first;
    String? subtitle;
    if (name.contains('(')) {
      subtitle = name.substring(name.indexOf('('), name.length);
    }
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: fgColor[Config.propertyKey],
        borderRadius: BorderRadius.circular(10),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: characterNameFontSize,
                color: textColor[Config.propertyKey],
                fontWeight: FontWeight.bold,
              ),
            ),
            if (subtitle != null)
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: characterDescriptionFontSize,
                  color: textColor[Config.propertyKey],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
