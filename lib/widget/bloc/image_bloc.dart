import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:client/utils/graphql_provider.dart';
import 'package:client/widget/graphql/image.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:meta/meta.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  @override
  ImageState get initialState => ImageInitial();

  @override
  Stream<ImageState> mapEventToState(
    ImageEvent event,
  ) async* {
    yield ImageLoading();

    if (event is NewImage) {
      final path = await FilePicker.getFilePath(type: FileType.image, allowedExtensions: ['jpg', 'jpeg', 'png']);
      
      final formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(path),
      });

      final response = await Dio().post("http://colourful.dlinkddns.com:3333/image", data: formData);

      yield ImageAdded(response: response);
    } else if (event is DeleteImage) {
      await hasura.mutation(IMAGE_DATA_DELETE, variables: {
        "id": event.id,
      });

      yield ImageDeleted();
    } else {
      yield ImageInitial();
    }
  }
}
