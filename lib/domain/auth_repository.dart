
import 'package:base/data/datasource/datasource.dart';
import 'package:base/data/models/user_model.dart';

abstract interface class AuthRepository {

  //supabase методы
  
  Future<DataState> logIn({required UserModel user});

  Future<DataState> signUp({required UserModel user});

  Future<DataState> logOut();

  Future<String> getEmail(); 


}