part of 'works_bloc.dart';

@immutable
abstract class WorksEvent {}

class GetWorks extends WorksEvent {

  final String filter;

  GetWorks({@required this.filter});

}
