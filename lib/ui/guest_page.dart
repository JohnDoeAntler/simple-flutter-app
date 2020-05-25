import 'package:client/bloc/auth0_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GuestPage extends StatefulWidget {
  const GuestPage({Key key}) : super(key: key);

  @override
  _GuestPageState createState() => _GuestPageState();
}

class _GuestPageState extends State<GuestPage> {
  
  @override
  Widget build(BuildContext context) {
    final Auth0Bloc authBloc = BlocProvider.of<Auth0Bloc>(context);

    return BlocListener<Auth0Bloc, Auth0State>(
        listener: (context, state){
          if (state is Auth0LoggedIn) {
            Navigator.of(context).pushReplacementNamed('/home');
          }
        },
        child: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Text("Reminiscence Therapy App login page"),
              FlatButton(
                onPressed: () {
                  authBloc.add(Login());
                },
                child: Text(
                  "Login"
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}