part of 'users_bloc.dart';

@immutable
abstract class UsersEvent {}

class GetUsers extends UsersEvent {

  final String filter;

  GetUsers({@required this.filter});

}
