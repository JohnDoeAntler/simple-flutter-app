import 'package:client/widget/user_item.dart';
import 'package:flutter/material.dart';

class UserList extends StatefulWidget {
  UserList({Key key, @required this.arr}) : super(key: key);

  final arr;

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.arr.length,
      itemBuilder: (context, index) {
        return UserItem(
          item: widget.arr[index],
        );
      },
    );
  }
}