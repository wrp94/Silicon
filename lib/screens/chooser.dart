import 'package:flutter/material.dart';

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
