import 'package:character_viewer/screens/character_details_screen.dart';
import 'package:character_viewer/screens/character_list_screen.dart';
import 'package:character_viewer/screens/tablet_layout_screen.dart';
import 'package:character_viewer/utils/colors.dart';
import 'package:character_viewer/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  Config.setAppConfigurations();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double shortestSide = MediaQuery.of(context).size.shortestSide;
    final bool isTablet = shortestSide > 600;

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: bgColor[Config.propertyKey]),
      routes: {
        CharacterListScreen.routeName: (context) => const CharacterListScreen(),
        CharacterDetailsScreen.routeName: (context) =>
            const CharacterDetailsScreen(),
        TabletLayoutScreen.routeName: (context) => TabletLayoutScreen(),
      },
      initialRoute: isTablet
          ? TabletLayoutScreen.routeName
          : CharacterListScreen.routeName,
    );
  }
}
