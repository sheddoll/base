import 'package:base/data/datasource/datasource.dart';
import 'package:base/data/datasource/local/hive_db_auth.dart';
import 'package:base/data/datasource/remote/supabase_auth.dart';
import 'package:base/data/models/user_model.dart';
import 'package:base/domain/auth_repository.dart';
import 'package:flutter/material.dart';

class AuthRepositoryImpl implements AuthRepository {
  final SupabaseAuth _supabaseAuth;
  final HiveUserDatabase _hiveDatabase;
  AuthRepositoryImpl(this._supabaseAuth, this._hiveDatabase);

  @override
  Future<DataState> logIn({required UserModel user}) async {
    
    try{
      await _supabaseAuth.logInWithEmail(user.email!, user.password!);
      return DataSuccess(user);
    }
    catch(e){
      debugPrint(e.toString());
      return DataFailed(e.toString());
    }
  }
  
  @override
  Future<DataState> signUp({required UserModel user}) async {
    try{
      if(user != null){
      final emailRegExp = RegExp(
          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'
        );
      await _supabaseAuth.signUpWithEmail(user.email!, user.password!);
      if(!(emailRegExp.hasMatch(user.email!))){
        return const DataFailed('Некорректный email');
      }
      return DataSuccess(user.email!);
      }
      else{
        return const DataFailed('User null');
      }
    }
    catch(e){
      debugPrint(e.toString());
      return DataFailed(e.toString());
    }
  }
  
  @override
  Future<String> getEmail() async {
    try{
      return _hiveDatabase.getUserEmail();
    }
    catch(e){
      return e.toString();
    }
    
  }

  @override
  Future<void> saveUser(UserModel user) async {
    try{
      return _hiveDatabase.saveUser(user);
    }
    catch(e){
      return debugPrint(e.toString());
    }

    
  }
  

}