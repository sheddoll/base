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

  @override
  Future<void> clearBox() async {

    return _localDatabase.clearBox();
    
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

  //common
  @override
  Future<List<NoteModel>> downloadAllNotes() async{
    final List<NoteModel> notes = await _remoteDatabase.getNotes();
    await _localDatabase.clearBox();
    await Future.wait(notes.map((note) => _localDatabase.saveNoteLocal(note)));
    return await _localDatabase.getNotesLocal();
  }
  @override
  Future<void> clearRemoteDatabase() async{
   return await _remoteDatabase.deleteAllNotes();
  }
  @override
  Future<void> uploadNotes() async{
    final List<NoteModel> notes = await _localDatabase.getNotesLocal();
    await _remoteDatabase.deleteAllNotes();
    await Future.wait(notes.map((note) => _remoteDatabase.addNote(note)));
  }
  
}