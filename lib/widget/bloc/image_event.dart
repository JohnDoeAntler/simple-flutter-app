part of 'image_bloc.dart';

@immutable
abstract class ImageEvent {}

class NewImage extends ImageEvent {

  // work id
  final id;

  NewImage({@required this.id});

}

class DeleteImage extends ImageEvent {

  // image id
  final id;

  DeleteImage({@required this.id});

}