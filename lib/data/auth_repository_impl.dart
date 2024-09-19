import 'package:base/data/datasource/datasource.dart';
import 'package:base/data/datasource/remote/supabase_auth.dart';
import 'package:base/data/models/user_model.dart';
import 'package:base/domain/auth_repository.dart';
import 'package:flutter/material.dart';

class AuthRepositoryImpl implements AuthRepository {
  final SupabaseAuth _supabaseAuth;
  AuthRepositoryImpl(this._supabaseAuth);

  @override
  Future<DataState> logIn({required UserModel user}) async {
      try{
        final response = await _supabaseAuth.logInWithEmail(user.email!, user.password!);
        return response;
      }     
      catch(e){
        debugPrint(e.toString());
        return DataFailed(e.toString());
      }
    
  }
  
  @override
  Future<DataState> signUp({required UserModel user}) async {
    try{
        final response = await _supabaseAuth.signUpWithEmail(user.email!, user.password!);
        return response;
      }     
      catch(e){
        debugPrint(e.toString());
        return DataFailed(e.toString());
      }
  }

  @override
  Future<DataState> logOut() async {
    try{
        final response = await _supabaseAuth.logOut();
        return response;
      }     
      catch(e){
        debugPrint(e.toString());
        return DataFailed(e.toString());
      }
  }
  
  @override
  Future<String> getEmail() async {
    try{
      return _supabaseAuth.getEmail();
    }
    catch(e){
      return e.toString();
    }
    
  }

  

}