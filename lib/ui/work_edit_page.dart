import 'package:flutter/material.dart';

class WorkEditPage extends StatefulWidget {
  const WorkEditPage({Key key, this.id}) : super(key: key);

  // work id
  final String id;

  @override
  _WorkEditPageState createState() => _WorkEditPageState();
}

class _WorkEditPageState extends State<WorkEditPage> {
  @override
  Widget build(BuildContext context) {
    return Text("work edit page.");
  }
}