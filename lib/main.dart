import 'package:base/app.dart';
import 'package:base/core/consts.dart';
import 'package:base/features/text_editor/data/datasource/local/hive_db.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';



main() async {
  await Hive.initFlutter();
  

  await Supabase.initialize( url: supabaseUrl, anonKey: supabaseKey ); //балуюсь
  final _future = Supabase.instance.client
      .from('auth')
      .select('');
    
  print('$_future я прибыл');
  runApp(const BaseApp());
}

