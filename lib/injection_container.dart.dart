import 'package:base/data/datasource/local/hive_db.dart';
import 'package:base/data/datasource/remote/supabase.dart';
import 'package:base/data/notes_repository_impl.dart';
import 'package:base/domain/notes_repository.dart';
import 'package:base/bloc/mobile/notes_bloc.dart';
import 'package:base/bloc/desktop/notes_bloc.dart';
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
  //db
  sl.registerSingleton(localDatabase);

  sl.registerSingleton(remoteDatabase);

  sl.registerSingleton(HiveDatabase());
  //repo
  sl.registerSingleton<NotesRepository>(
    NotesRepositoryImpl(sl(),sl())
  );


  //blocs
  sl.registerFactory<LocalNotesBloc>(
   ()=> (LocalNotesBloc())
  );
   sl.registerFactory<NotesBloc>(
   ()=> (NotesBloc(sl()))
  );

}

