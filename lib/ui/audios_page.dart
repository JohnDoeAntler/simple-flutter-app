import 'package:flutter/material.dart';

class AudioPage extends StatefulWidget {
  const AudioPage({Key key, this.id}) : super(key: key);

  // work id
  final String id;

  @override
  _AudioPageState createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  @override
  Widget build(BuildContext context) {
    return Text("audio page.");
  }
}