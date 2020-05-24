import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:client/graphql/works.dart';
import 'package:client/utils/graphql_provider.dart';
import 'package:meta/meta.dart';

part 'edit_work_event.dart';
part 'edit_work_state.dart';

class EditWorkBloc extends Bloc<EditWorkEvent, EditWorkState> {
  @override
  EditWorkState get initialState => EditWorkInitial();

  @override
  Stream<EditWorkState> mapEventToState(
    EditWorkEvent event,
  ) async* {
    yield EditWorkLoading();

    if (event is EditWork) {
      final response = await hasura.mutation(WORK_EDIT, variables: {
        "id": event.id,
        "description": event.description,
        "imageUrl": event.imageUrl,
        "visibility": event.visibility,
      });

      yield EditWorkLoaded(response: response);
    } else {
      yield EditWorkInitial();
    }
  }
}
