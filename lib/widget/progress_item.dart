import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class ProgressItem extends StatelessWidget {
  const ProgressItem({Key key, @required this.arr}) : super(key: key);

  final arr;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () async {
          final url = "http://colourful.dlinkddns.com:3333/${arr["resultUrl"] ?? arr["drivingVideoUrl"]}";
          if (await canLaunch(url))
            launch(url);
        },
        child: Container(
          height: 200,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Hero(
                  tag: arr["work"]["imageUrl"],
                  child: Image.network(
                    arr["work"]["imageUrl"],
                    fit: BoxFit.cover,
                  )
                ),
              ), Text("texting")
            ],
          ),
        ),
      ),
    );
  }
}