import 'package:client/bloc/auth0_bloc.dart';
import 'package:client/bloc/work_info_bloc.dart';
import 'package:client/widget/add_audio_button.dart';
import 'package:client/widget/add_image_button.dart';
import 'package:client/widget/synthesize_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkInfoPage extends StatefulWidget {
  const WorkInfoPage({Key key, this.id}) : super(key: key);

  // work id
  final String id;

  @override
  _WorkInfoPageState createState() => _WorkInfoPageState();
}

class _WorkInfoPageState extends State<WorkInfoPage> {

  WorkInfoBloc workInfoBloc = WorkInfoBloc();

  @override
  void initState() {
    super.initState();

    workInfoBloc.add(GetWorkInfo(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {

    final auth0Bloc = BlocProvider.of<Auth0Bloc>(context);

    return BlocBuilder<Auth0Bloc, Auth0State>(
      bloc: auth0Bloc,
      builder: (_, _state) {
        if (_state is Auth0LoggedIn) {
    return BlocBuilder<WorkInfoBloc, WorkInfoState>(
            bloc: workInfoBloc,
            builder: (context, state) {
              if (state is WorkInfoLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is WorkInfoLoaded) {

                final work = state.response["data"]["works_by_pk"];

                return ListView(
                  children: <Widget>[
                    Hero(
                      tag: work["imageUrl"],
                      child: Image.network(
                        work["imageUrl"],
                        fit: BoxFit.cover,
                        height: 300,
                      )
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Name",
                            style: TextStyle(
                              fontSize: 32,
                            ),
                          ),
                          Text(work["name"]),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Description",
                            style: TextStyle(
                              fontSize: 32,
                            ),
                          ),
                          Text("${work["description"]}"),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Likes",
                            style: TextStyle(
                              fontSize: 32,
                            ),
                          ),
                          Text("${work["likes_aggregate"]["aggregate"]["count"]}"),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Favourites",
                            style: TextStyle(
                              fontSize: 32,
                            ),
                          ),
                          Text("${work["favourites_aggregate"]["aggregate"]["count"]}"),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Views",
                            style: TextStyle(
                              fontSize: 32,
                            ),
                          ),
                          Text("${work["views"]}"),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Usage",
                            style: TextStyle(
                              fontSize: 32,
                            ),
                          ),
                          Text("${work["usage"]}"),
                          RaisedButton(
                            onPressed: () => Navigator.of(context).pushNamed("/work_edit", arguments: widget.id),
                            child: Text("Edit work information"),
                          ),
                          AddImageButton(id: widget.id),
                          AddAudioButton(id: widget.id),
                          SynthesizeButton(userId: _state.userId,workId: widget.id),
                        ],
                      )
                    ),
                  ],
                );
              } else {
                return Text("default.");
              }
            } 
          );
        } else {
          return Text("testing");
        }
      },
    );
  }
}