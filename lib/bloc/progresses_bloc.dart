import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:client/graphql/progresses.dart';
import 'package:client/utils/graphql_provider.dart';
import 'package:meta/meta.dart';

part 'progresses_event.dart';
part 'progresses_state.dart';

class ProgressesBloc extends Bloc<ProgressesEvent, ProgressesState> {
  @override
  ProgressesState get initialState => ProgressesInitial();

  @override
  Stream<ProgressesState> mapEventToState(
    ProgressesEvent event,
  ) async* {
    yield ProgressesLoading();

    if (event is GetProgresses) {

      final response = await hasura.query(GET_PROGRESSES, variables: {
        "id": event.id,
      });

      yield ProgressesLoaded(response: response);
    } else {
      yield ProgressesInitial();
    }
  }
}
