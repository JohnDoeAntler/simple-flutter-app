import 'package:flutter/material.dart';

class WorkItem extends StatelessWidget {

  final item;

  const WorkItem({
    Key key,
    @required this.item
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacementNamed('/work', arguments: item["id"]);
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
              ),
              Container(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Text("name: ${item["name"]}"),
                      Text("description: ${item["description"]}"),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}