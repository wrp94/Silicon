import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

/// _MyHomePageState is a subclass of State, which is a subclass of Object
class _MyHomePageState extends State<MyHomePage> {
  void _navigateToNewGame() {
    Navigator.of(context).pushNamed('/newGame');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        left: false,
        right: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white70),
                    backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 40)),
                  ),
                  onPressed: _navigateToNewGame,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "New Game",
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
