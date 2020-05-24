part of 'new_work_bloc.dart';

@immutable
abstract class NewWorkState {}

class NewWorkInitial extends NewWorkState {}

class NewWorkLoading extends NewWorkState {}

class NewWorkLoaded extends NewWorkState {

  final response;

  NewWorkLoaded({@required this.response});

}
