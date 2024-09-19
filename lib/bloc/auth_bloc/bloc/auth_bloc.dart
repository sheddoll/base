import 'package:base/bloc/auth_bloc/bloc/auth_utils.dart';
import 'package:base/data/models/user_model.dart';
import 'package:base/domain/auth_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _repository;
  AuthBloc(this._repository) : super(AuthInitial()) {
    on<LogInEvent>(_onLogIn);
    on<LogOutEvent>(_onLogOut);
    on<SignUpEvent>(_onSignUp);
    on<LoggedInEvent>(_onLoggedIn);
  }
  void _onLogIn(LogInEvent event, Emitter emit)async{
    emit(AuthLoading());
    try{
        if(inputChek(event.user.email!, event.user.password!)){
          emit(AuthFailure());
          emit(AuthInitial());
          return;
        }
        final status = await _repository.logIn(user: event.user);
        if(status.data == event.user.email){
          emit(LogInSuccess());
        }
        else{
          emit(AuthFailure());
          emit(AuthInitial());
        }
    }
    catch(e){
      debugPrint(e.toString());
      emit(AuthFailure());
      emit(AuthInitial());

    }
  }

  void _onLogOut(LogOutEvent event, Emitter emit) async {
    try{
      emit(AuthInitial());
      _repository.logOut();
    }
    catch(e){
      debugPrint(e.toString());
      emit(AuthFailure());
    }
  }

  void _onSignUp(SignUpEvent event, Emitter emit) async {
    emit(AuthLoading());
    try{
        if(inputChek(event.user.email!, event.user.password!)){
          emit(AuthFailure());
          emit(AuthInitial());
          return;
        }
        final status = await _repository.signUp(user: event.user);
        if(status.data == event.user.email){
          emit(SignUpSuccess());
          emit(AuthInitial());
        }
        else{
          emit(AuthFailure());
          emit(AuthInitial());
        }
      }
    catch(e){
      debugPrint(e.toString());
      emit(AuthFailure());
      emit(AuthInitial());

    }
  }

  void _onLoggedIn(LoggedInEvent event, Emitter emit)async{
    try{
      String email = await _repository.getEmail();
      if(email != ''){
        emit(LoggedIn());
      }
      else{
        emit(AuthInitial());
      }
    }
    catch(e){
      debugPrint(e.toString());
      emit(AuthInitial());
    }

  }

  
}


