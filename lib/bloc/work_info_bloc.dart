import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:client/graphql/works.dart';
import 'package:client/utils/graphql_provider.dart';
import 'package:meta/meta.dart';

part 'work_info_event.dart';
part 'work_info_state.dart';

class WorkInfoBloc extends Bloc<WorkInfoEvent, WorkInfoState> {
  @override
  WorkInfoState get initialState => WorkInfoInitial();

  @override
  Stream<WorkInfoState> mapEventToState(
    WorkInfoEvent event,
  ) async* {
    yield WorkInfoLoading();

    if (event is GetWorkInfo) {
      final response = await hasura.query(GET_WORK, variables: {
        "id": event.id,
      });

      yield WorkInfoLoaded(response: response);
    } else {
      yield WorkInfoInitial();
    }
  }
}
