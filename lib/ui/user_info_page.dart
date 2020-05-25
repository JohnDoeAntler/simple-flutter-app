import 'package:client/bloc/auth0_bloc.dart';
import 'package:client/bloc/user_info_bloc.dart';
import 'package:client/widget/work_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({Key key, this.id}) : super(key: key);

  // user id
  final String id;

  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {

  UserInfoBloc userInfoBloc = UserInfoBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    userInfoBloc.add(GetUserInfo(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {

    Auth0Bloc authBloc = BlocProvider.of<Auth0Bloc>(context);

    return BlocBuilder<UserInfoBloc, UserInfoState>(
      bloc: userInfoBloc,
      builder: (context, state) {
        if (state is UserInfoLoading) {
          return Center(
            child: CircularProgressIndicator()
          );
        } else if (state is UserInfoLoaded) {
          
          final user = state.response["data"]["users_by_pk"];

          return ListView(
            children: <Widget>[
              Hero(
                tag: user["imageUrl"],
                child: Image.network(
                  user["imageUrl"],
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
                    Text(user["name"]),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Followers",
                      style: TextStyle(
                        fontSize: 32,
                      ),
                    ),
                    Text("${user["followers_aggregate"]["aggregate"]["count"]}"),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Followings",
                      style: TextStyle(
                        fontSize: 32,
                      ),
                    ),
                    Text("${user["followings_aggregate"]["aggregate"]["count"]}"),
                  ],
                )
              ),
              WorkList(arr: user["works"], shrinkWrap: true),
            ],
          );
        } else {
          return Text("default.");
        }
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userInfoBloc.close();
  }
}