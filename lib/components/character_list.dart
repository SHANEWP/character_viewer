// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:character_viewer/components/character_name_card.dart';
import 'package:character_viewer/components/custom_search_bar.dart';
import 'package:character_viewer/models/character/character_list_model.dart';
import 'package:character_viewer/models/character/character_model.dart';
import 'package:character_viewer/screens/character_details_screen.dart';
import 'package:character_viewer/config.dart';

class CharacterList extends StatefulWidget {
  final bool isTablet;
  final void Function(CharacterModel)? selectedCharacterCallback;
  const CharacterList({
    Key? key,
    required this.isTablet,
    this.selectedCharacterCallback,
  }) : super(key: key);

  @override
  State<CharacterList> createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  late Future<CharacterListModel> futureCharacterList;
  String searchString = '';

  Future<CharacterListModel> fetchCharacterList() async {
    final response = await http.get(Uri.parse(Config.apiUrl ?? ''));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return CharacterListModel.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load characters');
    }
  }

  @override
  void initState() {
    super.initState();
    futureCharacterList = fetchCharacterList();
  }

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Column(
      children: [
        if (!isLandscape)
          CustomSearchBar(
            onChanged: (text) {
              setState(() {
                searchString = text;
              });
            },
          ),
        FutureBuilder<CharacterListModel>(
          future: futureCharacterList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<CharacterModel> filteredCharacters = filterList(
                snapshot.data!.characters,
                searchString,
              );
              return Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  addAutomaticKeepAlives: false,
                  itemCount: filteredCharacters.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        if (isLandscape && index == 0)
                          CustomSearchBar(
                            onChanged: (text) {
                              setState(() {
                                searchString = text;
                              });
                            },
                          ),
                        CharacterNameCard(
                          character: filteredCharacters[index],
                          onTap: () {
                            if (widget.selectedCharacterCallback != null) {
                              widget.selectedCharacterCallback!(
                                filteredCharacters[index],
                              );
                            }
                            if (!widget.isTablet) {
                              Navigator.pushNamed(
                                  context, CharacterDetailsScreen.routeName,
                                  arguments: filteredCharacters[index]);
                            }
                          },
                        ),
                      ],
                    );
                  },
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ],
    );
  }

  List<CharacterModel> filterList(
      List<CharacterModel> characters, String condition) {
    return characters
        .where((element) =>
            element.text.toLowerCase().contains(condition.toLowerCase()))
        .toList();
  }
}
