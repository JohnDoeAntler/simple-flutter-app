import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {

  final item;

  const UserItem({
    Key key,
    @required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacementNamed('/user', arguments: item["id"]);
        },
        child: Container(
          height: 200,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Hero(
                  tag: item["imageUrl"],
                  child: Image.network(
                    item["imageUrl"],
                    fit: BoxFit.cover,
                  )
                ),
              ), Text("username: ${item["name"]}")
            ],
          ),
        ),
      ),
    );
  }
}