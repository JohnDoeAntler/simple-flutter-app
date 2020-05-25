import 'package:client/bloc/user_info_bloc.dart';
import 'package:client/bloc/users_bloc.dart';
import 'package:client/widget/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key key}) : super(key: key);

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {

  UsersBloc usersBloc = UsersBloc();

  String filter = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          child: TextField(
            onChanged: (val) {
              usersBloc.add(GetUsers(filter: "$val"));
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
              if (state is UsersLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is UsersLoaded) {
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