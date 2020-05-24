part of 'edit_user_bloc.dart';

@immutable
abstract class EditUserState {}

class EditUserInitial extends EditUserState {}

class EditUserLoading extends EditUserState {}

class EditUserLoaded extends EditUserState {

  final response;

  EditUserLoaded({@required this.response});

}
