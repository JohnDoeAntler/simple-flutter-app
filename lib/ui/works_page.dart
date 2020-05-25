import 'package:client/bloc/works_bloc.dart';
import 'package:client/widget/work_list.dart';
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
        SizedBox(
          child: TextField(
            onChanged: (val){
              worksBloc.add(GetWorks(filter: "$val"));
            },
          ),
        ),
        SizedBox(
          height: 8,
        ),
        RaisedButton(
          onPressed: (){
            Navigator.of(context).pushNamed("/work_new");
          },
        ),
        SizedBox(
          height: 8,
        ),
        Expanded(
          child: BlocBuilder(
            bloc: worksBloc,
            builder: (context, state) {
              if (state is WorksLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is WorksLoaded) {
                return WorkList(arr: state.response["data"]["works"]);
              } else {
                return Text("Search particular work via searh bar.");
              }
            }
          ),
        ),
      ],
    );
  }
}