import 'package:base/data/datasource/local/hive_db.dart';
import 'package:base/data/repository_impl.dart';
import 'package:base/domain/repository.dart';
import 'package:base/bloc/mobile/notes_bloc.dart';
import 'package:base/bloc/desktop/desktop_notes_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/consts.dart';
import 'data/models/note_model.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async{
  
  await Hive.initFlutter();

  Hive.registerAdapter(NoteModelAdapter());
  
  final localDatabase = await Hive.openBox<NoteModel>('notes_box');
  final database = await Supabase.initialize( url: supabaseUrl, anonKey: supabaseKey ); //балуюсь
  //db
  sl.registerSingleton(localDatabase);

  sl.registerSingleton(database);

  sl.registerSingleton(HiveDatabase());
  //repo
  sl.registerSingleton<NotesRepository>(
    NotesRepositoryImpl(sl())
  );


  //blocs
  sl.registerFactory<LocalNotesBloc>(
   ()=> (LocalNotesBloc())
  );
   sl.registerFactory<DesktopNotesBloc>(
   ()=> (DesktopNotesBloc(sl()))
  );

}