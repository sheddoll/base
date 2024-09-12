part of 'notes_bloc.dart';

abstract class LocalNotesState {

  final List<NoteEntity> ? notes;

  const LocalNotesState({this.notes});

}

class LocalNotesInitial extends LocalNotesState {}

class LocalNotesLoading extends LocalNotesState {
  const LocalNotesLoading();
}

class LocalNotesDone extends LocalNotesState {

  const LocalNotesDone(List<NoteEntity> notes) : super(notes: notes);
}

class LocalNotesFailed extends LocalNotesState {
  const LocalNotesFailed();
}


  