part of 'progresses_bloc.dart';

@immutable
abstract class ProgressesState {}

class ProgressesInitial extends ProgressesState {}

class ProgressesLoading extends ProgressesState {}

class ProgressesLoaded extends ProgressesState {

  final response;

  ProgressesLoaded({@required this.response});

}
