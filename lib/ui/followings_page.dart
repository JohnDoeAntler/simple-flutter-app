import 'package:client/bloc/auth0_bloc.dart';
import 'package:client/bloc/followings_bloc.dart';
import 'package:client/widget/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FollowingsPage extends StatefulWidget {
  const FollowingsPage({Key key}) : super(key: key);

  @override
  _FollowingsPageState createState() => _FollowingsPageState();
}

class _FollowingsPageState extends State<FollowingsPage> {

  FollowingsBloc usersBloc = FollowingsBloc();

  String filter = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Auth0Bloc auth0bloc = BlocProvider.of<Auth0Bloc>(context);

    return Column(
      children: <Widget>[
        SizedBox(
          child: TextField(
            onChanged: (val) {
              usersBloc.add(GetFollowings(id: (auth0bloc.state as Auth0LoggedIn).userId, filter: "$val"));
            },
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Expanded(
            child: BlocBuilder(
            bloc: usersBloc,
            builder: (context, state) {
              if (state is FollowingsLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is FollowingsLoaded) {
                return UserList(arr: state.response["data"]["users"]);
              } else {
                return Text("Search particular user via searh bar.");
              }
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    usersBloc.close();
  }
}