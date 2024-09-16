import 'package:base/data/models/note_model.dart';

abstract interface class NotesRepository{
  

  //hive методы
  Future<List<NoteModel>> getSavedNotes();

  Future<void> saveNote(String title, String description);

  Future<void> deleteNote(int index);

  Future<void> updateNote(int index, String newDescription);

}
