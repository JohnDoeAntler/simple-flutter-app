import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:client/graphql/users.dart';
import 'package:client/utils/graphql_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'edit_user_event.dart';
part 'edit_user_state.dart';

class EditUserBloc extends Bloc<EditUserEvent, EditUserState> {
  @override
  EditUserState get initialState => EditUserInitial();

  @override
  Stream<EditUserState> mapEventToState(
    EditUserEvent event,
  ) async* {
    yield EditUserLoading();

    if (event is EditUser) {
      final response = await hasura.mutation(USER_EDIT, variables: {
        "id": event.id,
        "name": event.name,
        "imageUrl": event.imageUrl,
      });

      yield EditUserLoaded(response: response);
    } else {
      yield EditUserInitial();
    }
  }
}
