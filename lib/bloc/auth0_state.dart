part of 'auth0_bloc.dart';

@immutable
abstract class Auth0State {}

class Auth0Initial extends Auth0State {}

class Auth0Loading extends Auth0State {}

class Auth0LoggedIn extends Auth0State {

  final String userId;
  final String token;

  Auth0LoggedIn ({
    @required this.userId,
    @required this.token,
  });

}

class Auth0LoggedOut extends Auth0State {}
