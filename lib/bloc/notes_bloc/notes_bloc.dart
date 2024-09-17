import 'dart:collection';

import 'package:base/data/models/note_model.dart';
import 'package:base/domain/notes_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {

  final NotesRepository _repository;
  


  NotesBloc(this._repository) : super(const NotesInitial()) {

    on<SaveNotesEvent>(_onSave); 
    on<DeleteNoteEvent>(_onDelete);
    on<GetNotesEvent>(_onGet);
    on<UpdateNoteEvent>(_onUpdate);
    on<UpdateTextEvent>(_onUpdateText);
    on<HistoryEvent>(_onHistory);
   
  }

  void _onGet(GetNotesEvent event,Emitter<NotesState> emit) async {
    try{
      final notes = await _repository.localGetSavedNotes();
    if(notes.isEmpty){
      emit(const NotesInitial());
    }
    else{
      emit(NotesLoadingDone(notes));
    }
    }
    catch(e){ 
      debugPrint(e.toString());
      emit (const NotesFailed());
    }
    
  }

  void _onSave(SaveNotesEvent event,Emitter<NotesState> emit) async {
    if(event.note == null ){
    emit(const NotesFailed());
    }
    try{
      await _repository.localSaveNote(event.note!).whenComplete( () => _onGet(GetNotesEvent(), emit));
      _repository.remoteSaveNote(event.note!);
      debugPrint('Я помираю не в блоке');
    }
    catch(e){
      debugPrint(e.toString());
    }
  }

  void _onDelete(DeleteNoteEvent event,Emitter<NotesState> emit) async {
    try{
      if(event.note == null){
        emit(const NotesFailed());
      }
      else{
        await _repository.remoteDeleteNote(event.note!);
        await _repository.localDeleteNote(event.note!).whenComplete( () => _onGet(GetNotesEvent(), emit));
      }
    }
    catch(e){
      debugPrint(e.toString());
      emit (const NotesFailed());
    }
  }

  void _onUpdate(UpdateNoteEvent event,Emitter<NotesState> emit) async {
    try{
    // debugPrint('Хз вроде не работаю'+' ${event.note}'+' ${event.index}');
    await _repository.localUpdateNote(event.note!).whenComplete( () => _onGet(GetNotesEvent(), emit));
    _repository.remoteUpdateNote(event.note!);     
    //debugPrint('Хз вроде работаю');
    }
    catch(e){
      debugPrint(e.toString());
      emit (const NotesFailed());
    }
  }

  void _onUpdateText(UpdateTextEvent event, Emitter<NotesState> emit){

    emit(NotesTextUpdated(event.newText));

  }

  _onHistory(HistoryEvent event, Emitter emit){
    try{
      if(event.history == null){
        debugPrint(event.history.toString());
      emit(NotesFailed);
      }
      else{
      List<NoteModel> notes = event.history!.toList();
      emit(HistoryDone(notes));
      }
    }
    catch(e){
      debugPrint(e.toString());
      emit(NotesFailed); 
    }
  }

}
