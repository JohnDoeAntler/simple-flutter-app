part of 'edit_work_bloc.dart';

@immutable
abstract class EditWorkState {}

class EditWorkInitial extends EditWorkState {}

class EditWorkLoading extends EditWorkState {}

class EditWorkLoaded extends EditWorkState {

  final response;

  EditWorkLoaded({@required this.response});

}
