part of 'audio_bloc.dart';

@immutable
abstract class AudioEvent {}

class NewAudio extends AudioEvent {

  // work id
  final id;

  NewAudio({@required this.id});

}

class DeleteAudio extends AudioEvent {

  // audio id 
  final id;

  DeleteAudio({@required this.id});

}
