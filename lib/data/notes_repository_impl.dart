import 'package:base/data/datasource/local/hive_db.dart';
import 'package:base/data/datasource/remote/supabase_db.dart';
import 'package:base/data/models/note_model.dart';
import 'package:base/domain/notes_repository.dart';

class NotesRepositoryImpl implements NotesRepository{
  final HiveDatabase _localDatabase;
  final SupabaseDatabase _remoteDatabase;

  NotesRepositoryImpl(this._localDatabase, this._remoteDatabase);

  //hive
  @override
  Future<List<NoteModel>> localGetSavedNotes() async {
    
    return _localDatabase.getNotesLocal();
  }

  @override
  Future<void> localSaveNote(NoteModel note) async {
    
    return _localDatabase.saveNoteLocal(note);

  }

  @override
  Future<void> localDeleteNote(NoteModel note) async {

    return _localDatabase.deleteNoteLocal(note);

  }

  @override
  Future<void> localUpdateNote(NoteModel note) async {
    return _localDatabase.updateNoteLocal(note);

  }

  //supabase
  @override
  Future<List<NoteModel>> remoteGetSavedNotes() async {
    
    return _remoteDatabase.getNotes();
  }

  @override
  Future<void> remoteSaveNote(NoteModel note) async {
    return _remoteDatabase.addNote(note);
    

  }

  @override
  Future<void> remoteDeleteNote(NoteModel note) async {

    return _remoteDatabase.deleteNote(note);

  }

  @override
  Future<void> remoteUpdateNote(NoteModel note) async {
    return _remoteDatabase.updateNote(note);

  }
  
  
}