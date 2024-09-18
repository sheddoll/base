part of 'auth_bloc.dart';

abstract class AuthEvent {

}


class LogInEvent extends AuthEvent{
  final UserModel user;
  LogInEvent({required this.user});
}

class SignUpEvent extends AuthEvent{

  final UserModel user;
  SignUpEvent({required this.user});

}

class LogOutEvent extends AuthEvent{

}

class LoggedInEvent extends AuthEvent{

}