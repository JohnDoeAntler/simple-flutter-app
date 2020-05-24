import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:client/graphql/works.dart';
import 'package:client/utils/graphql_provider.dart';
import 'package:meta/meta.dart';

part 'works_event.dart';
part 'works_state.dart';

class WorksBloc extends Bloc<WorksEvent, WorksState> {
  @override
  WorksState get initialState => WorksInitial();

  @override
  Stream<WorksState> mapEventToState(
    WorksEvent event,
  ) async* {
    yield WorksLoading();

    if (event is GetWorks) {
      final response = await hasura.query(GET_WORKS, variables: {
        "filter": "%${event.filter}%",
      });

      yield WorksLoaded(response: response);
    } else {
      yield WorksInitial();
    }
  }
}
