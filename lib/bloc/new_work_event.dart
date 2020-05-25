part of 'new_work_bloc.dart';

@immutable
abstract class NewWorkEvent {}

class NewWork extends NewWorkEvent {

  final String name;
  final String description;
  final String imageUrl;
  final bool visibility;

  NewWork({
    @required this.name,
    @required this.description,
    @required this.imageUrl,
    @required this.visibility,
  });

}
