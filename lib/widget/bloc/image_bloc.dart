import 'dart:async';
import 'dart:io';

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
      Dio dio = Dio();
      dio.options.headers["Content-Type"] = "multipart/form-data";
      final path = await FilePicker.getFilePath(type: FileType.custom, allowedExtensions: ['jpg', 'jpeg', 'png']);

      final file = await MultipartFile.fromFile(path);
      
      final formData = FormData.fromMap({
        "id": event.id,
        "file": file,
      });

      try {
        final response = await dio.post("http://colourful.dlinkddns.com:3333/image", data: formData);
      yield ImageAdded(response: response);
      } catch (e) {
        print(e.toString());
      }

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
