part of 'notes_bloc.dart';


abstract class NotesEvent {}

class LoadNotesEvent extends NotesEvent{

}

class SaveNotesEvent extends NotesEvent{

}

class DeleteNotesEvent extends NotesEvent{
  
}
