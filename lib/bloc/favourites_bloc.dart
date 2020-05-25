import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:client/graphql/favourites.dart';
import 'package:client/utils/graphql_provider.dart';
import 'package:meta/meta.dart';

part 'favourites_event.dart';
part 'favourites_state.dart';

class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  @override
  FavouritesState get initialState => FavouritesInitial();

  @override
  Stream<FavouritesState> mapEventToState(
    FavouritesEvent event,
  ) async* {
    yield FavouritesLoading();

    if (event is GetFavourites) {

      final response = await hasura.query(GET_FAVOURITES, variables: {
        "id": event.id,
        "filter": "%${event.filter}%",
      });

      yield FavouritesLoaded(response: response);

    } else {
      yield FavouritesInitial();
    }
  }
}
