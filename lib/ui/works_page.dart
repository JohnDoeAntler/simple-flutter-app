import 'package:client/bloc/works_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorksPage extends StatefulWidget {
  const WorksPage({Key key}) : super(key: key);

  @override
  _WorksPageState createState() => _WorksPageState();
}

class _WorksPageState extends State<WorksPage> {

  final WorksBloc worksBloc = WorksBloc();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FlatButton(
          onPressed: () {
            worksBloc.add(GetWorks(filter: ""));
          },
          child: Text("query")
        ),
        BlocBuilder(
          bloc: worksBloc,
          builder: (context, state) {
            if (state is WorksLoading) {
              return CircularProgressIndicator();
            } else if (state is WorksLoaded) {
              return Text(state.response.toString());
            } else {
              return Text("default.");
            }
          }
        ),
      ],
    );
  }
}