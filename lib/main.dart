import 'package:flutter/material.dart';

void main() => runApp(const SiliconApp());

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
        '/newGame/selectIcons': (context) => const SelectIcons(),
      },
    ));
  }
}

class AppState {
  int? numPlayers;
  AppState(this.numPlayers);
}

class AppStateScope extends InheritedWidget {
  final AppState data;

  const AppStateScope(this.data, {Key? key, required Widget child})
      : super(key: key, child: child);

  static AppState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppStateScope>()!.data;
  }

  @override
  bool updateShouldNotify(AppStateScope oldWidget) {
    return data != oldWidget.data;
  }
}

class AppStateWidget extends StatefulWidget {
  final Widget child;

  const AppStateWidget({required this.child, Key? key}) : super(key: key);

  static AppStateWidgetState of(BuildContext context) {
    return context.findAncestorStateOfType<AppStateWidgetState>()!;
  }

  @override
  AppStateWidgetState createState() => AppStateWidgetState();
}

class AppStateWidgetState extends State<AppStateWidget> {
  final AppState _data = AppState(0);

  @override
  Widget build(BuildContext context) {
    return AppStateScope(
      _data,
      child: widget.child,
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
              SizedBox(height: 50,),
              PlayerButton(3),
              SizedBox(height: 50,),
              PlayerButton(4),
              SizedBox(height: 50,),
              PlayerButton(5),
              SizedBox(height: 50,),
              PlayerButton(6),
            ],
          ),
        ),
      ),
    );
  }
}

class PlayerButton extends StatefulWidget {
  const PlayerButton(this.playerNumber, {Key? key}) : super(key: key);
  final int playerNumber;

  @override
  State<PlayerButton> createState() => PlayerButtonState();
}

class PlayerButtonState extends State<PlayerButton> {
  PlayerButtonState();

  void _navigateToIconSelect(BuildContext context) {
    Navigator.of(context).pushNamed('/newGame/selectIcons');
  }

  @override
  Widget build(BuildContext context) {
    var numPlayers = widget.playerNumber;
    return ElevatedButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.white70),
        backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
        textStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 40)),
        minimumSize: MaterialStateProperty.all(const Size(300, 50)),
      ),
      onPressed: () {
        AppStateWidget.of(context)._data.numPlayers = numPlayers;
        _navigateToIconSelect(context);
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
