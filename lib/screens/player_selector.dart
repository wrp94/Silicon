import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// `Chooser` is a `StatefulWidget` that creates a `_ChooserState` which is a
/// `State` that builds a `Scaffold`
class PlayerSelector extends StatefulWidget {
  const PlayerSelector({super.key});

  @override
  State<PlayerSelector> createState() => _PlayerSelectorState();
}

class _PlayerSelectorState extends State<PlayerSelector> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //TODO implement multi-touch recognition
      child: const Scaffold(),
    );
  }
}
