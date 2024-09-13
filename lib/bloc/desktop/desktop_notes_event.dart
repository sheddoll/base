part of 'desktop_notes_bloc.dart';

abstract class DesktopNotesEvent {
  final NoteModel ? note;
  final int ? index;
  final String ? description;

  const DesktopNotesEvent({this.description,this.note, this.index});

}

class DesktopGetNotesEvent extends DesktopNotesEvent{
  
  DesktopGetNotesEvent();
  
}

class SaveNotesEvent extends DesktopNotesEvent{

  SaveNotesEvent(NoteModel note) : super(note: note);

}

class DeleteNoteEvent extends DesktopNotesEvent{

  DeleteNoteEvent(int index) : super(index: index);
  
}

class UpdateNoteEvent extends DesktopNotesEvent{

  UpdateNoteEvent(int index, String description):super(index: index ,description: description);
  
}

class UpdateTextEvent extends DesktopNotesEvent {
  final String newText;

  UpdateTextEvent(this.newText);
}