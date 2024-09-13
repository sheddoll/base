part of 'notes_bloc.dart';

abstract class LocalNotesState {

  final List<NoteModel> ? notes;

  const LocalNotesState({this.notes});

}

class LocalNotesInitial extends LocalNotesState {}

class LocalNotesLoading extends LocalNotesState {
  const LocalNotesLoading();
}

class LocalNotesDone extends LocalNotesState {

  const LocalNotesDone(List<NoteModel> notes) : super(notes: notes);
}

class LocalNotesFailed extends LocalNotesState {
  const LocalNotesFailed();
}


  