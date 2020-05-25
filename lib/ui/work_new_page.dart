import 'package:client/bloc/new_work_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkNewPage extends StatefulWidget {
  const WorkNewPage({Key key}) : super(key: key);

  @override
  _WorkNewPageState createState() => _WorkNewPageState();
}

class _WorkNewPageState extends State<WorkNewPage> {

  String name;
  String description;
  String imageUrl;
  bool visibility;

  NewWorkBloc newWorkBloc = NewWorkBloc();

  @override
  Widget build(BuildContext context) {
   return ListView(
      children: <Widget>[
        Text("Name"),
        TextFormField(
          onChanged: (val) {
            setState(() {
              name = val;
            });
          },
          initialValue: name,
        ),
        Text("Description"),
        TextFormField(
          onChanged: (val) {
            setState(() {
              description = val;
            });
          },
          initialValue: description,
        ),
        Text("imageUrl"),
        TextFormField(
          onChanged: (val) {
            setState(() {
              imageUrl = val;
            });
          },
          initialValue: imageUrl,
        ),
        Text("visibility"),
        Checkbox(
          value: visibility ?? true,
          onChanged: (val) {
            setState(() {
              visibility = val;
            });
          },
        ),
        RaisedButton(
          onPressed: () {
              print(this.name);
              print(this.description);
              print(this.imageUrl);
              print(this.visibility);
            newWorkBloc.add(
              NewWork(
                name: this.name,
                description: this.description,
                imageUrl: this.imageUrl,
                visibility: this.visibility,
              )
            );
          },
          child: Text("submit"),
        )
      ],
    );
  }
}