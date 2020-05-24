import 'package:client/bloc/auth0_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageDrawer extends StatelessWidget {
  const PageDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Auth0Bloc authBloc = BlocProvider.of<Auth0Bloc>(context);

    return Drawer(
      child:  ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Luggage Management System"),
              accountEmail: Text("Hackathon 2019"),
              decoration: BoxDecoration(
                color: Color.fromRGBO(0x00, 0x64, 0x5A, 1)
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundColor: Colors.transparent,
                  child: ClipOval(
                    child: Image.network(
                      "https://pbs.twimg.com/profile_images/526631556341719040/PGyxRgFH_400x400.jpeg",
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.pushNamed(context, "/home");
              },
            ),
            Container(
              height: 1.0,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1.0, color: Colors.black12)
                )
              ),
            ),
            ListTile(
              title: Text('Browse Users'),
              leading: Icon(Icons.supervised_user_circle),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/users');
              },
            ),
            Container(
              height: 1.0,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1.0, color: Colors.black12)
                )
              ),
            ),
            ListTile(
              title: Text('Browse Works'),
              leading: Icon(Icons.portrait),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/works');
              },
            ),
            Container(
              height: 1.0,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1.0, color: Colors.black12)
                )
              ),
            ),
            ListTile(
              title: Text('Followings'),
              leading: Icon(Icons.compare_arrows),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/followings');
              },
            ),
            Container(
              height: 1.0,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1.0, color: Colors.black12)
                )
              ),
            ),
            ListTile(
              title: Text('Favourites'),
              leading: Icon(Icons.favorite),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/favourites');
              },
            ),
            Container(
              height: 1.0,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1.0, color: Colors.black12)
                )
              ),
            ),
            ListTile(
              title: Text('Progresses'),
              leading: Icon(Icons.cloud_upload),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/progresses');
              },
            ),
            Container(
              height: 1.0,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1.0, color: Colors.black12)
                )
              ),
            ),
            ListTile(
              title: Text('Logout'),
              leading: Icon(Icons.exit_to_app),
              onTap: () {
                authBloc.add(Logout());
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
          ],
        ),
    );
  }
}