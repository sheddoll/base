import 'package:base/bloc/auth_bloc/bloc/auth_bloc.dart';
import 'package:base/bloc/qr_bloc/qr_bloc.dart';
import 'package:base/data/auth_repository_impl.dart';
import 'package:base/data/datasource/local/hive_db.dart';
import 'package:base/data/datasource/remote/supabase_auth.dart';
import 'package:base/data/datasource/remote/supabase_db.dart';
import 'package:base/data/notes_repository_impl.dart';
import 'package:base/domain/auth_repository.dart';
import 'package:base/domain/notes_repository.dart';
import 'package:base/bloc/notes_bloc/notes_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/consts.dart';
import 'data/models/note_model.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async{
  
  await Hive.initFlutter();
  await Supabase.initialize( url: supabaseUrl, anonKey: supabaseKey );
  Hive.registerAdapter(NoteModelAdapter());
  final SupabaseDatabase remoteDatabase = SupabaseDatabase();
  final localDatabase = await Hive.openBox<NoteModel>('notes_box');
  final SupabaseAuth auth = SupabaseAuth();
  //db
  sl.registerSingleton(localDatabase);

  sl.registerSingleton(remoteDatabase);
  sl.registerSingleton(auth);

  sl.registerSingleton(HiveDatabase());

  //repo
  sl.registerSingleton<NotesRepository>(
    NotesRepositoryImpl(sl(),sl())
  );
  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(sl())
  );


  //blocs
  sl.registerFactory<NotesBloc>(
   ()=> (NotesBloc(sl()))
  );
  sl.registerFactory<AuthBloc>(
   ()=> (AuthBloc(sl()))
  );
  sl.registerFactory<QrBloc>(
   ()=> (QrBloc(sl()))
  );

}

