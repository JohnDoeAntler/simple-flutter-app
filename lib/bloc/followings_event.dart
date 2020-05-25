part of 'followings_bloc.dart';

@immutable
abstract class FollowingsEvent {}

class GetFollowings extends FollowingsEvent {

  GetFollowings({@required this.id, @required this.filter});

  final id;
  final filter;

}
