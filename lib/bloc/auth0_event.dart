part of 'auth0_bloc.dart';

@immutable
abstract class Auth0Event {}

class Login extends Auth0Event {}

class Logout extends Auth0Event {}