import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import 'package:silicon/widgets/app_state.dart';

/// `Chooser` is a `StatefulWidget` that creates a `_ChooserState` which is a
/// `State` that builds a `Scaffold`
class PlayerSelector extends StatefulWidget {
  const PlayerSelector({super.key});

  @override
  State<PlayerSelector> createState() => _PlayerSelectorState();
}

class _PlayerSelectorState extends State<PlayerSelector> {
  var pointerCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO implement multi-touch recognition
      body: Listener(
        onPointerDown: (event) {},
      ),
    );
  }
}
