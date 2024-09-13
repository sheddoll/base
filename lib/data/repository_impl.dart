import 'package:base/data/datasource/local/hive_db.dart';
import 'package:base/data/models/note_model.dart';
import 'package:base/domain/repository.dart';

class NotesRepositoryImpl implements NotesRepository{
  final HiveDatabase _database;

  NotesRepositoryImpl(this._database);

  
  @override
  Future<List<NoteModel>> getSavedNotes(){
    
    return _database.getNotes();
  }

  @override
  Future<void> saveNote(String title, String description){
    
    return _database.saveNote(title, description);

  }

  @override
  Future<void> deleteNote(int index){

    return _database.deleteNote(index);

  }

  @override
  Future<void> updateNote(int index, String newDescription){

    return _database.updateNote(index, newDescription);

  }
  
  
}