import 'package:client/bloc/auth0_bloc.dart';
import 'package:client/bloc/progresses_bloc.dart';
import 'package:client/widget/progress_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProgressesPage extends StatefulWidget {
  const ProgressesPage({Key key}) : super(key: key);

  @override
  _ProgressesPageState createState() => _ProgressesPageState();
}

class _ProgressesPageState extends State<ProgressesPage> {

  ProgressesBloc progressesBloc = ProgressesBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Auth0Bloc auth0Bloc = BlocProvider.of<Auth0Bloc>(context);
    progressesBloc.add(GetProgresses(id: (auth0Bloc.state as Auth0LoggedIn).userId));

    return BlocBuilder<ProgressesBloc, ProgressesState>(
      bloc: progressesBloc,
      builder: (context, state) {
        if (state is ProgressesLoading) {
          return CircularProgressIndicator();
        } else if (state is ProgressesLoaded) {
          return ProgressLlist(arr: state.response["data"]["progresses"]);
        } else {
          return Text("default");
        }
      }
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    progressesBloc.close();
  }
}