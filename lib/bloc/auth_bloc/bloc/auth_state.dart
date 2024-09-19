part of 'auth_bloc.dart';

abstract class AuthState {

}

class AuthInitial extends AuthState {
  AuthInitial();

}

class AuthLoading extends AuthState {

}

class AuthFailure extends AuthState {

}

class LogInSuccess extends AuthState {

}

class LogOutSuccess extends AuthState {

}

class SignUpSuccess extends AuthState{
  
}

class LoggedIn extends AuthState{

}



