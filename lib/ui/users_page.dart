import 'package:client/bloc/user_info_bloc.dart';
import 'package:client/bloc/users_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key key}) : super(key: key);

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {

  // UsersBloc usersBloc = UsersBloc();
  UserInfoBloc userInfoBloc = UserInfoBloc();

  String filter = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FlatButton(
          onPressed: () {

            // usersBloc.add(GetUsers(filter: ""));
            userInfoBloc.add(GetUserInfo(id: "auth0|5e89a066f23bc20bf0d27b58"));
          },
          child: Text("query"),
        ),
        BlocBuilder(
          // bloc: usersBloc,
          bloc: userInfoBloc,
          builder: (context, state) {
            if (state is UserInfoLoading) {
              return CircularProgressIndicator();
            } else if (state is UserInfoLoaded) {
              return Text(state.response.toString());
            } else {
              return Text("default.");
            }
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // usersBloc.close();
    userInfoBloc.close();
  }
}