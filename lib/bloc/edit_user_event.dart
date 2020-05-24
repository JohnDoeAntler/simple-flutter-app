part of 'edit_user_bloc.dart';

@immutable
abstract class EditUserEvent {}

class EditUser extends EditUserEvent {

  final id;
  final name;
  final imageUrl;

  EditUser({
    @required this.id,
    this.name,
    this.imageUrl
  });

}
