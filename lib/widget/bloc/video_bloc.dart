import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:meta/meta.dart';

part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  @override
  VideoState get initialState => VideoInitial();

  @override
  Stream<VideoState> mapEventToState(
    VideoEvent event,
  ) async* {
    yield VideoLoading();

    if (event is NewVideo) {

      final path = await FilePicker.getFilePath(type: FileType.custom, allowedExtensions: ['mp4']);
      
      final formData = FormData.fromMap({
        "userId": event.userId,
        "workId": event.workId,
        "file": await MultipartFile.fromFile(path),
      });

      final response = await Dio().post("http://colourful.dlinkddns.com:3333/progress", data: formData);
     
      yield VideoLoaded(response: response);

    } else {
      yield VideoInitial();
    }
  }
}
