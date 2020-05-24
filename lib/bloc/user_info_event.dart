part of 'user_info_bloc.dart';

@immutable
abstract class UserInfoEvent {}

class GetUserInfo extends UserInfoEvent {

    final String id;

    GetUserInfo({@required this.id});

}
