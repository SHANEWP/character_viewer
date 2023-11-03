// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:character_viewer/utils/colors.dart';
import 'package:character_viewer/utils/fonts.dart';

class CustomSearchBar extends StatelessWidget {
  final Function(String) onChanged;
  const CustomSearchBar({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: TextField(
        style: const TextStyle(
          color: searchBarFontColor,
          fontSize: searchBarFontSize,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: searchBarFillColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          hintText: "Search",
          hintStyle: const TextStyle(
            color: searchBarHintFontColor,
            fontSize: searchBarFontSize,
          ),
          prefixIcon: const Icon(Icons.search),
          prefixIconColor: searchBarIconColor,
        ),
        onChanged: (text) {
          onChanged(text);
        },
      ),
    );
  }
}
