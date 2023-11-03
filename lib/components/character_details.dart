// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:character_viewer/models/character/character_model.dart';
import 'package:character_viewer/utils/colors.dart';
import 'package:character_viewer/utils/fonts.dart';
import 'package:flutter/material.dart';

import 'package:character_viewer/components/details_descriptioin.dart';
import 'package:character_viewer/components/details_image.dart';
import 'package:character_viewer/components/details_name.dart';

class CharacterDetails extends StatelessWidget {
  final CharacterModel? character;
  const CharacterDetails({
    Key? key,
    this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (character != null) {
      return ListView(
        children: <Widget>[
          Center(
            child: Column(
              children: [
                DetailsName(character: character!),
                const SizedBox(height: 10),
                DetailsImage(character: character!),
                const SizedBox(height: 10),
                DetailsDescription(character: character!),
              ],
            ),
          ),
        ],
      );
    } else {
      return const Center(
        child: Text(
          'No Character Selected',
          style: TextStyle(
            color: noCharacterSelectedColor,
            fontSize: noCharacterSelectedFontSize,
          ),
        ),
      );
    }
  }
}
