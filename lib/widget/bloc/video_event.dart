part of 'video_bloc.dart';

@immutable
abstract class VideoEvent {}

class NewVideo extends VideoEvent {

  final userId;

  final workId;

  NewVideo({@required this.userId, @required this.workId});

}