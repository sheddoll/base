import 'package:base/core/usecases.dart';
import 'package:base/features/text_editor/domain/entity/note_entity.dart';
import 'package:base/features/text_editor/domain/usecases/delete_saved_note.dart';
import 'package:base/features/text_editor/domain/usecases/get_saved_notes.dart';
import 'package:base/features/text_editor/domain/usecases/save_note.dart';
import 'package:base/features/text_editor/domain/usecases/update_saved_notes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class LocalNotesBloc extends Bloc<LocalNotesEvent, LocalNotesState> {

  final GetSavedNotesUsecase _getSavedNotesUsecase;
  final SaveNoteUsecase _saveNoteUsecase;
  final UpdateSavedNotesUsecase _updateSavedNotes;
  final DeleteSavedNoteUsecase _deleteSavedNote;


  LocalNotesBloc(
    this._getSavedNotesUsecase, 
    this._saveNoteUsecase, 
    this._updateSavedNotes, 
    this._deleteSavedNote) : super(const LocalNotesLoading()) {

   // on<SaveNotesEvent>(_onSave); 
    //on<DeleteNoteEvent>(_onDelete);
    on<GetNotesEvent>(_onGet);
   
  }

  void _onGet(GetNotesEvent event,Emitter<LocalNotesState> emit) async {
    final notes = await _getSavedNotesUsecase();
    emit(LocalNotesDone(notes));
  }

}


