import 'package:base/features/text_editor/data/datasource/local/hive_db.dart';
import 'package:base/features/text_editor/data/repository_impl.dart';
import 'package:base/features/text_editor/domain/repository.dart';
import 'package:base/features/text_editor/domain/usecases/delete_saved_note.dart';
import 'package:base/features/text_editor/domain/usecases/get_saved_notes.dart';
import 'package:base/features/text_editor/domain/usecases/save_note.dart';
import 'package:base/features/text_editor/domain/usecases/update_saved_notes.dart';
import 'package:base/features/text_editor/presentation/bloc/bloc/local/notes_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/consts.dart';
import 'features/text_editor/data/note_model.dart';

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

  //usecases
  sl.registerSingleton<SaveNoteUsecase>(
    SaveNoteUsecase(sl())
  );
  sl.registerSingleton<GetSavedNotesUsecase>(
    GetSavedNotesUsecase(sl())
  );
  sl.registerSingleton<DeleteSavedNoteUsecase>(
    DeleteSavedNoteUsecase(sl())
  );
  sl.registerSingleton<UpdateSavedNotesUsecase>(
    UpdateSavedNotesUsecase(sl())
  );

  //blocs
  sl.registerFactory<LocalNotesBloc>(
   ()=> (LocalNotesBloc(sl(),sl(),sl(),sl()))
  );

}