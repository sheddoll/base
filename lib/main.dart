import 'package:base/app.dart';
import 'package:base/data/datasource/remote/supabase.dart';
import 'package:base/data/notes_repository_impl.dart';
import 'package:base/domain/notes_repository.dart';
import 'package:base/injection_container.dart.dart';
import 'package:flutter/material.dart';





main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  SupabaseDatabase().addNote('123','1234455');
  SupabaseDatabase().addNote('Index?','paspsss');
  SupabaseDatabase().deleteNote('0');
  SupabaseDatabase().updateNote('1','newdescr');
  print(SupabaseDatabase().getNotes().toString());

  

  runApp(const BaseApp());
}

