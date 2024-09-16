part of 'notes_bloc.dart';

abstract class NotesEvent {
  final NoteModel ? note;
  final int ? index;
  final String ? description;
  final Queue<NoteModel> ? history;

  const NotesEvent({this.description,this.note, this.index, this.history});

}

class GetNotesEvent extends NotesEvent{
  
  GetNotesEvent();
  
}

class SaveNotesEvent extends NotesEvent{

  SaveNotesEvent(NoteModel note) : super(note: note);

}

class DeleteNoteEvent extends NotesEvent{

  DeleteNoteEvent(int index) : super(index: index);
  
}

class UpdateNoteEvent extends NotesEvent{

  UpdateNoteEvent(int index, String description):super(index: index ,description: description);
  
}

class UpdateTextEvent extends NotesEvent {
  final String newText;

  UpdateTextEvent(this.newText);
}

class HistoryEvent extends NotesEvent{

 HistoryEvent(Queue<NoteModel> history):super(history: history);
  
}