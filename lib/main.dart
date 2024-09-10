import 'package:base/app.dart';
import 'package:base/core/consts.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {

  await Supabase.initialize( url: supabaseUrl, anonKey: supabaseKey ); //балуюсь
  final _future = Supabase.instance.client
      .from('auth')
      .select('');
    
  print('$_future я прибыл');
  runApp(const BaseApp());
}

