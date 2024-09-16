import 'package:base/data/datasource/local/hive_db.dart';
import 'package:base/data/datasource/remote/supabase.dart';
import 'package:base/data/models/note_model.dart';
import 'package:base/domain/notes_repository.dart';

class NotesRepositoryImpl implements NotesRepository{
  final HiveDatabase _localDatabase;
  final SupabaseDatabase _remoteDatabase;

  NotesRepositoryImpl(this._localDatabase, this._remoteDatabase);

  //hive
  @override
  Future<List<NoteModel>> localGetSavedNotes(){
    
    return _localDatabase.getNotesLocal();
  }

  @override
  Future<void> localSaveNote(String title, String description){
    
    return _localDatabase.saveNoteLocal(title, description);

  }

  @override
  Future<void> localDeleteNote(int index){

    return _localDatabase.deleteNoteLocal(index);

  }

  @override
  Future<void> localUpdateNote(int index, String newDescription){
    return _localDatabase.updateNoteLocal(index, newDescription);

  }

  //supabase
  @override
  Future<List<NoteModel>> remoteGetSavedNotes(){
    
    return _remoteDatabase.getNotes();
  }

  @override
  Future<void> remoteSaveNote(String title, String description){
    
    return _remoteDatabase.addNote(title, description);

  }

  @override
  Future<void> remoteDeleteNote(int index){

    return _remoteDatabase.deleteNote(index.toString());

  }

  @override
  Future<void> remoteUpdateNote(int index, String newDescription){
    return _remoteDatabase.updateNote(index.toString(), newDescription);

  }
  
  
}