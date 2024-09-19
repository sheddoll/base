import 'package:base/data/datasource/datasource.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuth {
  final SupabaseClient supabaseClient = Supabase.instance.client; 

  Future<DataState> logInWithEmail(String email, String password)async{
    try{
      final response = await supabaseClient.auth.signInWithPassword(email: email,password: password);
      //debugPrint(response.user!.email);
      return DataSuccess(response.user! .email!);
    }
    catch(e){
      debugPrint(e.toString());
      return const DataFailed('Ошибка');
    }
  }

  Future<DataState> signUpWithEmail(String email, String password)async{
    try{
      final response = await supabaseClient.auth.signUp(email: email,password: password);
      if(response.user == null){
        throw Exception();
      }
      //debugPrint(response.user!.id);
      return DataSuccess(response.user!.email!);
    }
    catch(e){
      debugPrint(e.toString());
      return DataFailed(e.toString());
    }
  }

  Future<DataState> logOut() async{
    try{
      await supabaseClient.auth.signOut();
      return const DataSuccess('Вышел');
    }
    catch(e){
      debugPrint(e.toString());
      return const DataFailed('Ошибка');
    }
    

  }

  Future<String> getEmail()async{
    try{
      String email = supabaseClient.auth.currentUser!.email!;
      return email;
    }
    catch(e){
      return '';
    }
  }
}