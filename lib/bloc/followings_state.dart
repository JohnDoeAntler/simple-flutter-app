part of 'followings_bloc.dart';

@immutable
abstract class FollowingsState {}

class FollowingsInitial extends FollowingsState {}

class FollowingsLoading extends FollowingsState {}

class FollowingsLoaded extends FollowingsState {

  final response;

  FollowingsLoaded({@required this.response});

}
