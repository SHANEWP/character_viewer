// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:character_viewer/components/character_details.dart';
import 'package:character_viewer/components/character_list.dart';
import 'package:character_viewer/components/logo.dart';
import 'package:character_viewer/models/character/character_model.dart';
import 'package:character_viewer/utils/colors.dart';
import 'package:character_viewer/config.dart';

class TabletLayoutScreen extends StatefulWidget {
  static String routeName = '/tablet-layout';
  CharacterModel? character;
  TabletLayoutScreen({
    Key? key,
    this.character,
  }) : super(key: key);

  @override
  State<TabletLayoutScreen> createState() => _TabletLayoutScreenState();
}

class _TabletLayoutScreenState extends State<TabletLayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Config.appName ?? 'Character Viewer'),
        backgroundColor: fgColor[Config.propertyKey],
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const Logo(),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.only(
                          bottom: 5,
                        ),
                        child: CharacterList(
                          isTablet: true,
                          selectedCharacterCallback: setCharacter,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      flex: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 1
                          : 2,
                      child: Container(
                        margin: const EdgeInsets.only(
                          bottom: 10,
                        ),
                        child: CharacterDetails(
                          character: widget.character,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  setCharacter(CharacterModel character) {
    setState(() {
      widget.character = character;
    });
  }
}
