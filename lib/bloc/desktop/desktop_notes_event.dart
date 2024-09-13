part of 'desktop_notes_bloc.dart';

abstract class DesktopNotesEvent {
  final NoteModel ? note;
  final int ? index;

  const DesktopNotesEvent({this.note, this.index});

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

  UpdateNoteEvent(NoteModel note) : super(note: note);
  
}