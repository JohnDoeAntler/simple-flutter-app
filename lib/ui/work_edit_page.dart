import 'package:client/bloc/edit_work_bloc.dart';
import 'package:client/bloc/work_info_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkEditPage extends StatefulWidget {
  const WorkEditPage({Key key, this.id}) : super(key: key);

  // work id
  final String id;

  @override
  _WorkEditPageState createState() => _WorkEditPageState();
}

class _WorkEditPageState extends State<WorkEditPage> {

  String name;
  String description;
  String imageUrl;
  bool visibility;

  EditWorkBloc editWorkBloc = EditWorkBloc();
  WorkInfoBloc workInfoBloc = WorkInfoBloc();

  @override
  void initState() {
    super.initState();

    workInfoBloc.add(GetWorkInfo(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditWorkBloc, EditWorkState>(
      bloc: editWorkBloc,
      listener: (context, state){
        if (state is EditWorkLoaded) {
          Navigator.of(context).pushNamed("/work", arguments: widget.id);
        }
      },
      child: BlocConsumer<WorkInfoBloc, WorkInfoState>(
        bloc: workInfoBloc,
        listener: (context, state) {
          if (state is WorkInfoLoaded) {
            setState(() {
              final work = state.response["data"]["works_by_pk"];
              name = work["name"];
              description = work["description"];
              imageUrl = work["imageUrl"];
              visibility = work["visibility"];
            });
          }
        },
        builder: (context, state) {
          if (state is WorkInfoLoaded) {
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
                    editWorkBloc.add(
                      EditWork(
                        id: widget.id,
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
          } else {
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    editWorkBloc.close();
    workInfoBloc.close();
  }
}