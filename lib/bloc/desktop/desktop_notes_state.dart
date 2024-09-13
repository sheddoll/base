part of 'desktop_notes_bloc.dart';

abstract class DesktopNotesState {

  final List<NoteModel> ? notes;

  const DesktopNotesState({this.notes});

}

class DesktopNotesInitial extends DesktopNotesState {
  const DesktopNotesInitial();
}

class DesktopNotesLoading extends DesktopNotesState {
  const DesktopNotesLoading();
}

class DesktopNotesLoadingDone extends DesktopNotesState {

  const DesktopNotesLoadingDone(List<NoteModel> notes) : super(notes: notes);
}

class DesktopNotesLoadingFailed extends DesktopNotesState {
  const DesktopNotesLoadingFailed();
}

class DesktopNotesSaved extends DesktopNotesState {

  const DesktopNotesSaved();
}

class DesktopNotesSaveFailed extends DesktopNotesState {

  const DesktopNotesSaveFailed();
}

class DesktopNotesDeleted extends DesktopNotesState {

  const DesktopNotesDeleted();
}

class DesktopNotesDeleteFailed extends DesktopNotesState {

  const DesktopNotesDeleteFailed();
}

class DesktopNotesUpdated extends DesktopNotesState {

  const DesktopNotesUpdated();
}

class DesktopNotesUpdateFailed extends DesktopNotesState {

  const DesktopNotesUpdateFailed();
}

class DesktopNotesTextUpdated extends DesktopNotesState {
  final String updatedText;

  DesktopNotesTextUpdated(this.updatedText);
}