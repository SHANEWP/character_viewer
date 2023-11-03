// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:character_viewer/models/character/character_model.dart';
import 'package:character_viewer/screens/character_details_screen.dart';
import 'package:character_viewer/utils/colors.dart';
import 'package:character_viewer/config.dart';
import 'package:character_viewer/utils/fonts.dart';

class CharacterNameCard extends StatelessWidget {
  final CharacterModel character;
  final Function onTap;

  const CharacterNameCard({
    Key? key,
    required this.character,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: fgColor[Config.propertyKey],
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              character.text.split('-')[0],
              style: TextStyle(
                fontSize: listNameFontSize,
                color: textColor[Config.propertyKey],
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        onTap();
      },
    );
  }
}
