import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:client/graphql/followings.dart';
import 'package:client/utils/graphql_provider.dart';
import 'package:meta/meta.dart';

part 'followings_event.dart';
part 'followings_state.dart';

class FollowingsBloc extends Bloc<FollowingsEvent, FollowingsState> {
  @override
  FollowingsState get initialState => FollowingsInitial();

  @override
  Stream<FollowingsState> mapEventToState(
    FollowingsEvent event,
  ) async* {
    yield FollowingsLoading();

    if (event is GetFollowings) {

      final response = await hasura.query(GET_FOLLOWINGS, variables:  {
        "id": event.id,
        "filter": "%${event.filter}%",
      });

      yield FollowingsLoaded(response: response);
      
    } else {
      yield FollowingsInitial();
    }
  }
}
