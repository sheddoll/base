part of 'notes_bloc.dart';


abstract class LocalNotesEvent {
  final NoteModel ? note;

  const LocalNotesEvent({this.note});

}

class GetNotesEvent extends LocalNotesEvent{
  
  GetNotesEvent();
  
}

class SaveNotesEvent extends LocalNotesEvent{

  SaveNotesEvent(NoteModel note) : super(note: note);

}

class DeleteNoteEvent extends LocalNotesEvent{

  DeleteNoteEvent(NoteModel note) : super(note: note);
  
}

class UpdateNoteEvent extends LocalNotesEvent{

  UpdateNoteEvent(NoteModel note) : super(note: note);
  
}