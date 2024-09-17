import 'package:base/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HiveUserDatabase{



  Future<void> saveUser(UserModel user) async {
    
    final box = await Hive.openBox('user');
    try{
      if(!Hive.isAdapterRegistered(2)){
        Hive.registerAdapter(UserModelAdapter());
      }
      await box.put('email',user.email);
    }
    catch(e){
      debugPrint(e.toString());
    }

  }

  Future<bool> authStatus() async{
    try{
      final box = await Hive.openBox('user');
      if(box.isNotEmpty){
        return true;
      }
      else{
        return false;
      }
    }
    catch(e){
      debugPrint(e.toString());
      return false;
    }
  }

  Future<String> getUserEmail() async{
    try{
      final box = await Hive.openBox('user');
      String email = box.get('email');
      return email;
    }
    catch(e){
      debugPrint(e.toString());
      return 'Error';
    }
  }  

}