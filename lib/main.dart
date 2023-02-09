import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

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
        '/newGame/chooser': (context) => const Chooser(),
      },
    ));
  }
}

/// AppState is a class that has a single property called numPlayers, which is an
/// integer.
class AppState {
  int numPlayers;
  AppState(this.numPlayers);
}

/// It's a widget that provides a value to its descendants
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

/// `AppStateWidget` is a `StatefulWidget` that provides a `State` object to its
/// descendants
class AppStateWidget extends StatefulWidget {
  final Widget child;

  const AppStateWidget({required this.child, Key? key}) : super(key: key);

  static AppStateWidgetState of(BuildContext context) {
    return context.findAncestorStateOfType<AppStateWidgetState>()!;
  }

  @override
  AppStateWidgetState createState() => AppStateWidgetState();
}

/// `AppStateWidget` is a `StatefulWidget` that wraps the `AppStateScope` widget,
/// which is a `StatelessWidget`
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

/// `Chooser` is a `StatefulWidget` that creates a `_ChooserState` which is a
/// `State` that builds a `Scaffold`
class Chooser extends StatefulWidget {
  const Chooser({super.key});

  @override
  State<Chooser> createState() => _ChooserState();
}

class _ChooserState extends State<Chooser> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO implement multi-touch recognition
    );
  }
}

/// `NewGame` is a stateful widget that creates a `_NewGameState` object
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
        AppStateWidget.of(context)._data.numPlayers = numPlayers;
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

/// `MyHomePage` is a `StatefulWidget` that creates a `_MyHomePageState` object
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
