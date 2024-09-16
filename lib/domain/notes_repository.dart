import 'package:base/data/models/note_model.dart';

abstract interface class NotesRepository{
  

  //hive методы
  Future<List<NoteModel>> localGetSavedNotes();

  Future<void> localSaveNote(String title, String description);

  Future<void> localDeleteNote(int index);

  Future<void> localUpdateNote(int index, String newDescription);

  //supabase методы
  Future<List<NoteModel>> remoteGetSavedNotes();

  Future<void> remoteSaveNote(String title, String description);

  Future<void> remoteDeleteNote(int index);

  Future<void> remoteUpdateNote(int index, String newDescription);

}
