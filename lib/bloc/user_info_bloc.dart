import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:client/graphql/users.dart';
import 'package:client/utils/graphql_provider.dart';
import 'package:meta/meta.dart';

part 'user_info_event.dart';
part 'user_info_state.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  @override
  UserInfoState get initialState => UserInfoInitial();

  @override
  Stream<UserInfoState> mapEventToState(
    UserInfoEvent event,
  ) async* {
    yield UserInfoLoading();

    if (event is GetUserInfo) {
      final response = await hasura.query(GET_USER_DETAIL, variables: {
        "id": event.id,
      });

      yield UserInfoLoaded(response: response);
    } else {
      yield UserInfoInitial();
    }
  }
}
