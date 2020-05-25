part of 'video_bloc.dart';

@immutable
abstract class VideoState {}

class VideoInitial extends VideoState {}

class VideoLoading extends VideoState {}

class VideoLoaded extends VideoState {

  final response;

  VideoLoaded({@required this.response});

}
