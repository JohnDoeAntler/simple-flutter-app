import 'package:client/bloc/auth0_bloc.dart';
import 'package:client/bloc/favourites_bloc.dart';
import 'package:client/widget/work_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({Key key}) : super(key: key);

  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {

  FavouritesBloc worksBloc = FavouritesBloc();

  @override
  Widget build(BuildContext context) {
    Auth0Bloc auth0bloc = BlocProvider.of<Auth0Bloc>(context);

    return Column(
      children: <Widget>[
        SizedBox(
          child: TextField(
            onChanged: (val){
              worksBloc.add(GetFavourites(id: (auth0bloc as Auth0LoggedIn).userId, filter: "$val"));
            },
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Expanded(
          child: BlocBuilder(
            bloc: worksBloc,
            builder: (context, state) {
              if (state is FavouritesLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is FavouritesLoaded) {
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