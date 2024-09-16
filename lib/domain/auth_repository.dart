
import 'package:base/data/datasource.dart';
import 'package:base/data/models/user_model.dart';

abstract interface class AuthRepository {

  Future<DataState> logIn({required UserModel user});
  Future<DataState> signUp({required UserModel user});

}