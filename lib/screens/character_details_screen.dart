import 'package:character_viewer/components/character_details.dart';
import 'package:character_viewer/components/details_descriptioin.dart';
import 'package:character_viewer/components/details_image.dart';
import 'package:character_viewer/components/details_name.dart';
import 'package:character_viewer/models/character/character_model.dart';
import 'package:character_viewer/utils/colors.dart';
import 'package:character_viewer/config.dart';
import 'package:flutter/material.dart';

class CharacterDetailsScreen extends StatefulWidget {
  static String routeName = "/character-details";
  const CharacterDetailsScreen({super.key});

  @override
  State<CharacterDetailsScreen> createState() => _CharacterDetailsScreenState();
}

class _CharacterDetailsScreenState extends State<CharacterDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final character =
        ModalRoute.of(context)?.settings.arguments as CharacterModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(Config.appName ?? 'Character Viewer'),
        backgroundColor: fgColor[Config.propertyKey],
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.all(20),
            child: CharacterDetails(character: character)),
      ),
    );
  }
}
