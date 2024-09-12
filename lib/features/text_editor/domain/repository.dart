import 'package:base/features/text_editor/domain/entity/note_entity.dart';

abstract interface class NotesRepository{
  
  


  //hive методы
  Future<List<NoteEntity>> getSavedNotes();

  Future<void> saveNote(String title, String description);

  Future<void> deleteNote(int index);

  Future<void> updateNote(int index, String newDescription);

}