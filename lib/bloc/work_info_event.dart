part of 'work_info_bloc.dart';

@immutable
abstract class WorkInfoEvent {}

class GetWorkInfo extends WorkInfoEvent {

  final String id;

  GetWorkInfo({ @required this.id });

}
