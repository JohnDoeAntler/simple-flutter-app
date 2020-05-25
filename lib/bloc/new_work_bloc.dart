import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:client/graphql/works.dart';
import 'package:client/utils/graphql_provider.dart';
import 'package:meta/meta.dart';

part 'new_work_event.dart';
part 'new_work_state.dart';

class NewWorkBloc extends Bloc<NewWorkEvent, NewWorkState> {
  @override
  NewWorkState get initialState => NewWorkInitial();

  @override
  Stream<NewWorkState> mapEventToState(
    NewWorkEvent event,
  ) async* {
    yield NewWorkLoading();

    if (event is NewWork) {
      final response = await hasura.mutation(WORK_NEW, variables: {
        "name": event.name,
        "description": event.description,
        "imageUrl": event.imageUrl,
        "visibility": event.visibility,
      });

      yield NewWorkLoaded(response: response);
    } else {
      yield NewWorkInitial();
    }
  }
}
