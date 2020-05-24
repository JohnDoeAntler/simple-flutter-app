import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {

  final id;
  final name;
  final imageUrl;

  const UserItem({
    Key key,
    @required this.id,
    @required this.name,
    @required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
        imageUrl
      ),
    );
  }
}