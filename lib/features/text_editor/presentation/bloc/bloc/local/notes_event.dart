part of 'notes_bloc.dart';


abstract class LocalNotesEvent {
  final NoteEntity ? note;

  const LocalNotesEvent({this.note});

}

class GetNotesEvent extends LocalNotesEvent{
  
  GetNotesEvent();
  
}

class SaveNotesEvent extends LocalNotesEvent{

  SaveNotesEvent(NoteEntity note) : super(note: note);

}

class DeleteNoteEvent extends LocalNotesEvent{

  DeleteNoteEvent(NoteEntity note) : super(note: note);
  
}

class UpdateNoteEvent extends LocalNotesEvent{

  UpdateNoteEvent(NoteEntity note) : super(note: note);
  
}