import 'package:client/widget/drawer.dart';
import 'package:flutter/material.dart';

class MemberWrapper extends StatefulWidget {
  const MemberWrapper({Key key, @required this.widget}) : super(key: key);

  final Widget widget;

  @override
  _MemberWrapperState createState() => _MemberWrapperState();
}

class _MemberWrapperState extends State<MemberWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reminiscence Therapy App"),
      ),
      drawer: PageDrawer(),
      body: widget.widget,
    );
  }
}