import 'package:flutter/material.dart';
import 'package:silicon/screens/home_screen.dart';
import 'package:silicon/screens/new_game.dart';
import 'package:silicon/screens/chooser.dart';
import 'package:silicon/widgets/app_state.dart';

class SiliconApp extends StatelessWidget {
  const SiliconApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppStateWidget(
        child: MaterialApp(
      title: 'Silicon',
      theme: ThemeData.dark(),
      routes: {
        '/': (context) => const MyHomePage(),
        '/newGame': (context) => const NewGame(),
        '/newGame/chooser': (context) => const Chooser(),
      },
    ));
  }
}
