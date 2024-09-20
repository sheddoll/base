import 'package:base/data/models/note_model.dart';
import 'package:base/domain/notes_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {

  final NotesRepository _repository;
  bool isRemote = true;


  NotesBloc(this._repository) : super(const NotesInitial()) {

    on<SaveNotesEvent>(_onSave); 
    on<DeleteNoteEvent>(_onDelete);
    on<GetNotesEvent>(_onGet);
    on<UpdateNoteEvent>(_onUpdate);
    on<UpdateTextEvent>(_onUpdateText);
    on<DownloadAllSavedNotesEvent>(_onDownloadAllSavedNotes);
    on<LocalClearNotesEvent>(_onClearNotes);
    on<ClearAllNotesEvent>(_onClearAllNotes);
    on<ToggleRemoteEvent>(_onConfigChange); 
  }

  void _onGet(GetNotesEvent event,Emitter<NotesState> emit) async {
    try{
      emit(const NotesInitial());
      final notes = await _repository.localGetSavedNotes();
    if(notes.isNotEmpty){
       emit(NotesLoadingDone(notes));
    }
    }
    catch(e){ 
      debugPrint(e.toString());
      emit (const NotesFailed());
    }
    
  }

  void _onSave(SaveNotesEvent event,Emitter<NotesState> emit) async {
    if(event.note.title == null ){
    emit(const NotesFailed());
    }
    try{
      await _repository.localSaveNote(event.note).whenComplete( () => _onGet(GetNotesEvent(), emit));
      if(isRemote){
        _repository.remoteSaveNote(event.note);
      }
    }
    catch(e){
      debugPrint(e.toString());
    }
  }

  void _onDelete(DeleteNoteEvent event,Emitter<NotesState> emit) async {
    try{
      if(event.note.title == null){
        emit(const NotesFailed());
      }
      else{
        await _repository.localDeleteNote(event.note).whenComplete( () => _onGet(GetNotesEvent(), emit));
        if(isRemote){
          await _repository.remoteDeleteNote(event.note);
        }
      }
    }
    catch(e){
      debugPrint(e.toString());
      emit (const NotesFailed());
    }
  }

  void _onUpdate(UpdateNoteEvent event,Emitter<NotesState> emit) async {
    try{
    await _repository.localUpdateNote(event.note).whenComplete( () => _onGet(GetNotesEvent(), emit));
    if(isRemote){
    _repository.remoteUpdateNote(event.note);
    }     
    }
    catch(e){
      debugPrint(e.toString());
      emit (const NotesFailed());
    }
  }

  void _onUpdateText(UpdateTextEvent event, Emitter<NotesState> emit){

    emit(NotesTextUpdated(event.newText));

  }

  void _onDownloadAllSavedNotes(DownloadAllSavedNotesEvent event, Emitter<NotesState> emit) async {
    emit(const NotesLoading());
    final notes = await _repository.downloadAllNotes();
    emit(NotesLoadingDone(notes));
  }
    
  void _onClearNotes(LocalClearNotesEvent event,Emitter<NotesState> emit) async {
    await _repository.clearBox();
    emit(const NotesInitial());
  } 
  
  void _onClearAllNotes(ClearAllNotesEvent event,Emitter<NotesState> emit) async {
    if(isRemote){
      await _repository.clearRemoteDatabase();
    }
    
    await _repository.clearBox().whenComplete( () => _onGet(GetNotesEvent(), emit));
  } 

  void _onConfigChange(ToggleRemoteEvent event,Emitter<NotesState> emit) async {
    emit(RemoteConfigurationsChanged());
    isRemote = event.isRemote!;
    if(isRemote){
      await _repository.uploadNotes().whenComplete(() => _onGet(GetNotesEvent(), emit));
    }
    else{
      _onGet(GetNotesEvent(), emit);
    }
    
  }
}
