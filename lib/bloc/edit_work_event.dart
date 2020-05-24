part of 'edit_work_bloc.dart';

@immutable
abstract class EditWorkEvent {}

class EditWork extends EditWorkEvent {

  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final bool visibility;

  EditWork({
    @required this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.visibility,
  });

}
