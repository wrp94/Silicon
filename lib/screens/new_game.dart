import 'package:flutter/material.dart';
import 'package:silicon/widgets/player_button.dart';

class NewGame extends StatefulWidget {
  const NewGame({super.key});

  @override
  State<NewGame> createState() => _NewGameState();
}

/// It's a stateful widget that displays a screen with a title and a bunch of
/// buttons that let you choose how many players you want to play with
class _NewGameState extends State<NewGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Game"),
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        left: false,
        right: false,
        child: Center(
          child: Column(
            children: const [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "How many players?",
                  style: TextStyle(
                    fontSize: 36,
                  ),
                ),
              ),
              SizedBox(width: 200.0, height: 30.0),
              PlayerButton(2),
              SizedBox(
                height: 50,
              ),
              PlayerButton(3),
              SizedBox(
                height: 50,
              ),
              PlayerButton(4),
              SizedBox(
                height: 50,
              ),
              PlayerButton(5),
              SizedBox(
                height: 50,
              ),
              PlayerButton(6),
            ],
          ),
        ),
      ),
    );
  }
}
