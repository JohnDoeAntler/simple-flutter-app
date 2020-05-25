part of 'progresses_bloc.dart';

@immutable
abstract class ProgressesEvent {}

class GetProgresses extends ProgressesEvent {

  final id;

  GetProgresses({@required this.id});

}
