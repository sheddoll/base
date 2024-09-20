part of 'auth_bloc.dart';

abstract class AuthEvent {
  final UserModel ? user;
  AuthEvent({this.user});
}


class LogInEvent extends AuthEvent{
  UserModel user;
  LogInEvent(this.user):super(user: user);
  
}

class SignUpEvent extends AuthEvent{

  UserModel user;
  SignUpEvent(this.user) : super(user: user);

}

class LogOutEvent extends AuthEvent{

}

class LoggedInEvent extends AuthEvent{

}
