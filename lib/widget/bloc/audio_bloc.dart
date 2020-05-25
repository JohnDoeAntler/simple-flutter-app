import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:client/utils/graphql_provider.dart';
import 'package:client/widget/graphql/audio.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:meta/meta.dart';

part 'audio_event.dart';
part 'audio_state.dart';

class AudioBloc extends Bloc<AudioEvent, AudioState> {
  @override
  AudioState get initialState => AudioInitial();

  @override
  Stream<AudioState> mapEventToState(
    AudioEvent event,
  ) async* {
    yield AudioLoading();

    if (event is NewAudio) {

      final path = await FilePicker.getFilePath(type: FileType.custom, allowedExtensions: ['mp3']);
      
      final formData = FormData.fromMap({
        "id": event.id,
        "file": await MultipartFile.fromFile(path),
      });

      final response = await Dio().post("http://colourful.dlinkddns.com:3333/audio", data: formData);
     
      yield AudioAdded(response: response);
    } else if (event is DeleteAudio) {
      await hasura.mutation(AUDIO_DATA_DELETE, variables: {
        "id": event.id,
      });

      yield AudioDeleted();
    } else {
      yield AudioInitial();
    }
  }
}
