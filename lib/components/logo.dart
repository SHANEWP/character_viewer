import 'package:character_viewer/config.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait &&
        Config.listScreenImageUrl != null) {
      return Image.asset(
        Config.listScreenImageUrl!,
        height: 200,
      );
    } else {
      return Container();
    }
  }
}
