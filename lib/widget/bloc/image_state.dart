part of 'image_bloc.dart';

@immutable
abstract class ImageState {}

class ImageInitial extends ImageState {}

class ImageLoading extends ImageState {}

class ImageAdded extends ImageState {

  final response;

  ImageAdded({@required this.response});

}

class ImageDeleted extends ImageState {}
