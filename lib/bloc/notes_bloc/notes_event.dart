part of 'notes_bloc.dart';

abstract class NotesEvent {
  final NoteModel ? note;
  final Queue<NoteModel> ? history;

  const NotesEvent({this.note, this.history,});

}

class GetNotesEvent extends NotesEvent{
  
  GetNotesEvent();
  
}

class SaveNotesEvent extends NotesEvent{

  SaveNotesEvent(NoteModel note) :super(note: note);

}

class DeleteNoteEvent extends NotesEvent{

  DeleteNoteEvent(NoteModel note) : super(note: note);
  
}

class UpdateNoteEvent extends NotesEvent{

  UpdateNoteEvent(NoteModel note):super(note: note);
  
}

class UpdateTextEvent extends NotesEvent {
  final String newText;

  UpdateTextEvent(this.newText);
}

class UpdateAllSavedNotesEvent extends NotesEvent{
  UpdateAllSavedNotesEvent();
}