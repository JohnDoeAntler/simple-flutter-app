part of 'audio_bloc.dart';

@immutable
abstract class AudioState {}

class AudioInitial extends AudioState {}

class AudioLoading extends AudioState {}

class AudioAdded extends AudioState {

  final response;

  AudioAdded({@required this.response});

}

class AudioDeleted extends AudioState {}
