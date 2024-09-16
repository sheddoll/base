import 'package:base/data/datasource/local/hive_db.dart';
import 'package:base/data/models/note_model.dart';
import 'package:base/domain/notes_repository.dart';

class NotesRepositoryImpl implements NotesRepository{
  final HiveDatabase _database;

  NotesRepositoryImpl(this._database);

  
  @override
  Future<List<NoteModel>> getSavedNotes(){
    
    return _database.getNotesLocal();
  }

  @override
  Future<void> saveNote(String title, String description){
    
    return _database.saveNoteLocal(title, description);

  }

  @override
  Future<void> deleteNote(int index){

    return _database.deleteNoteLocal(index);

  }

  @override
  Future<void> updateNote(int index, String newDescription){
    return _database.updateNoteLocal(index, newDescription);

  }
  
  
}