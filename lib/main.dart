import 'package:flutter/material.dart';

void main() => runApp(const SiliconApp());

class SiliconApp extends StatelessWidget {
  const SiliconApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Silicon',
      theme: ThemeData.dark(),
      routes: {
        '/': (context) => const MyHomePage(),
        '/newGame': (context) => const NewGame(),
        '/newGame/selectIcons': (context) => const SelectIcons(),
      },
    );
  }
}

class SelectIcons extends StatefulWidget {
  const SelectIcons({super.key});

  @override
  State<SelectIcons> createState() => _SelectIconsState();
}

class _SelectIconsState extends State<SelectIcons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Icons'),
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        left: false,
        right: false,
        child: Center(
          child: Column(
            children: const [
              Text('yeet'),
            ],
          ),
        ),
      ),
    );
  }
}

class NewGame extends StatefulWidget {
  const NewGame({super.key});

  @override
  State<NewGame> createState() => _NewGameState();
}

class _NewGameState extends State<NewGame> {

  void _navigateToIconSelect() {
    Navigator.of(context).pushNamed('/newGame/selectIcons');
  }

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
            children: [
              const Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  "How many players?",
                  style: TextStyle(
                    fontSize: 36,
                  ),
                ),
              ),
              const SizedBox(width: 200.0, height: 100.0),
              ElevatedButton(
                onPressed: _navigateToIconSelect,
                child: const Padding(
                  padding: EdgeInsets.all(6),
                  child: Text(
                    "data",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

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
