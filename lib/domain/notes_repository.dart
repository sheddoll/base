import 'package:base/data/models/note_model.dart';

abstract interface class NotesRepository{
  

  //hive методы
  Future<List<NoteModel>> localGetSavedNotes();

  Future<void> localSaveNote(NoteModel note);

  Future<void> localDeleteNote(NoteModel note);

  Future<void> localUpdateNote(NoteModel note);

  Future<void> clearBox();

  //supabase методы
  Future<List<NoteModel>> remoteGetSavedNotes();

  Future<void> remoteSaveNote(NoteModel note);

  Future<void> remoteDeleteNote(NoteModel note);

  Future<void> remoteUpdateNote(NoteModel note);

  Future<void> clearRemoteDatabase();
  //common методы
  Future<List<NoteModel>> downloadAllNotes();
  
  Future<void> uploadNotes();

}
