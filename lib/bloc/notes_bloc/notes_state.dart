part of 'notes_bloc.dart';

abstract class NotesState {

  final List<NoteModel> ? notes;
  const NotesState({this.notes});

}

class NotesInitial extends NotesState {
  const NotesInitial();
}

class NotesLoading extends NotesState {
  const NotesLoading();
}

class NotesLoadingDone extends NotesState {

  const NotesLoadingDone(List<NoteModel> notes) : super(notes: notes);
}




class NotesUpdated extends NotesState {

  const NotesUpdated();
}

class NotesTextUpdated extends NotesState {
  final String updatedText;

  NotesTextUpdated(this.updatedText);
}

class NotesFailed extends NotesState {

  const NotesFailed();
}

class RemoteConfigurationsChanged extends NotesState{
  
}

