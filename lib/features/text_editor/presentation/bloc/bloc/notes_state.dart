part of 'notes_bloc.dart';

abstract class NotesState {}

final class NotesInitial extends NotesState {}

final class NotesLoading extends NotesState {}

final class NotesDone extends NotesState {}

final class NotesFailed extends NotesState {}
