import 'package:flutter/material.dart';

class WorkInfoPage extends StatefulWidget {
  const WorkInfoPage({Key key, this.id}) : super(key: key);

  // work id
  final String id;

  @override
  _WorkInfoPageState createState() => _WorkInfoPageState();
}

class _WorkInfoPageState extends State<WorkInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Text("work info apge.");
  }
}