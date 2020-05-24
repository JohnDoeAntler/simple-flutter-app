import 'package:flutter/material.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({Key key, this.id}) : super(key: key);

  // user id
  final String id;

  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.id != null ? "user info page" : "user profile page"
    );
  }
}