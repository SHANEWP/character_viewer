// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:character_viewer/components/character_list.dart';
import 'package:character_viewer/components/logo.dart';
import 'package:character_viewer/utils/colors.dart';
import 'package:character_viewer/config.dart';
import 'package:flutter/material.dart';

class CharacterListScreen extends StatelessWidget {
  static String routeName = '/character-list';
  const CharacterListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Config.appName ?? 'Character Viewer'),
        backgroundColor: fgColor[Config.propertyKey],
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Logo(),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: const CharacterList(
                  isTablet: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
