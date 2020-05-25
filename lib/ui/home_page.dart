import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text("Reminiscence Therapy App home page"),
          Text("Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloremque aspernatur esse quas harum eum molestiae voluptatibus alias? Repudiandae cum earum autem ea esse, quo quaerat vitae officia non quam perspiciatis! Lorem ipsum dolor, sit amet consectetur adipisicing elit. Tenetur quae sapiente qui vel deserunt id quo, distinctio sunt rerum enim tempora vitae voluptate quibusdam quia repellat nam ipsam omnis vero.")
        ],
      ),
    );
  }
}