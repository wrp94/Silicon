import 'package:flutter/material.dart';
//import 'package:silicon/main.dart';
import 'package:silicon/widgets/app_state.dart';

/// `PlayerButton` is a stateful widget that displays a button for a player
class PlayerButton extends StatefulWidget {
  const PlayerButton(this.playerNumber, {Key? key}) : super(key: key);
  final int playerNumber;

  @override
  State<PlayerButton> createState() => PlayerButtonState();
}

/// This class is a stateful widget that displays a button with a number on it. When
/// the button is pressed, it sets the number of players in the app state and
/// navigates to the chooser screen
class PlayerButtonState extends State<PlayerButton> {
  PlayerButtonState();

  void _navigateToChooser(BuildContext context) {
    Navigator.of(context).pushNamed('/newGame/chooser');
  }

  @override
  Widget build(BuildContext context) {
    var numPlayers = widget.playerNumber;
    return ElevatedButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.white70),
        backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
        textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 40)),
        minimumSize: MaterialStateProperty.all(const Size(300, 50)),
      ),
      onPressed: () {
        AppStateWidget.of(context).get().numPlayers = numPlayers;
        _navigateToChooser(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Text(
          numPlayers.toString(),
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
