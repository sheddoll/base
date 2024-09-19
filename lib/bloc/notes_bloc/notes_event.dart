part of 'notes_bloc.dart';

abstract class NotesEvent {
  final NoteModel ? note;

  const NotesEvent({this.note,});

}

class GetNotesEvent extends NotesEvent{
  
  GetNotesEvent();
  
}

class SaveNotesEvent extends NotesEvent{
  NoteModel note;
  SaveNotesEvent(this.note) :super(note: note);

}

class DeleteNoteEvent extends NotesEvent{
  NoteModel note;
  DeleteNoteEvent(this.note) : super(note: note); // поправить
  
}

class UpdateNoteEvent extends NotesEvent{
  NoteModel note;
  UpdateNoteEvent(this.note):super(note: note);
  
}

class UpdateTextEvent extends NotesEvent {
  final String newText;

  UpdateTextEvent(this.newText);
}

class UpdateAllSavedNotesEvent extends NotesEvent{
  UpdateAllSavedNotesEvent();
}

//class UploadNotesEvent extends NotesEvent{
//  UploadNotesEvent();
//}

class LocalClearNotesEvent extends NotesEvent{
  LocalClearNotesEvent();
}

class ClearAllNotesEvent extends NotesEvent{
  ClearAllNotesEvent();
}