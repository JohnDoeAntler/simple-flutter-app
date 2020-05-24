import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:client/graphql/users.dart';
import 'package:client/utils/graphql_provider.dart';
import 'package:meta/meta.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  @override
  UsersState get initialState => UsersInitial();

  @override
  Stream<UsersState> mapEventToState(
    UsersEvent event,
  ) async* {
    yield UsersLoading();

    if (event is GetUsers) {

      final response = await hasura.query(GET_USERS, variables: {
        "filter": "%${event.filter}%"
      });

      yield UsersLoaded(response: response);
    } else {
      yield UsersInitial();
    }
  }
}
