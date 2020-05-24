part of 'work_info_bloc.dart';

@immutable
abstract class WorkInfoState {}

class WorkInfoInitial extends WorkInfoState {}

class WorkInfoLoading extends WorkInfoState {}

class WorkInfoLoaded extends WorkInfoState {

  final response;

  WorkInfoLoaded({ @required this.response, });

}
