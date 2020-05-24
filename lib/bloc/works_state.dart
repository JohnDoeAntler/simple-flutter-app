part of 'works_bloc.dart';

@immutable
abstract class WorksState {}

class WorksInitial extends WorksState {}

class WorksLoading extends WorksState {}

class WorksLoaded extends WorksState {

  final response;

  WorksLoaded({ @required this.response });

}
