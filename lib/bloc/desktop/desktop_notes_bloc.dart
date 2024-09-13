import 'dart:math';

import 'package:base/data/models/note_model.dart';
import 'package:base/domain/repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'desktop_notes_event.dart';
part 'desktop_notes_state.dart';

class DesktopNotesBloc extends Bloc<DesktopNotesEvent, DesktopNotesState> {

  final NotesRepository _repository;
  


  DesktopNotesBloc(this._repository) : super(const DesktopNotesInitial()) {

    on<SaveNotesEvent>(_onSave); 
    on<DeleteNoteEvent>(_onDelete);
    on<DesktopGetNotesEvent>(_onGet);
    on<UpdateNoteEvent>(_onUpdate);
    on<UpdateTextEvent>(_onUpdateText);
   
  }

  void _onGet(DesktopGetNotesEvent event,Emitter<DesktopNotesState> emit) async {
    try{
      final notes = await _repository.getSavedNotes();
    if(notes == []){
      emit(const DesktopNotesLoadingFailed());
    }
    else{
      emit(DesktopNotesLoadingDone(notes));
    }
    }
    catch(e){ 
      debugPrint(e.toString());
      emit (const DesktopNotesLoadingFailed());
    }
    
  }

  void _onSave(SaveNotesEvent event,Emitter<DesktopNotesState> emit) async {
    if(event.note == null ){
    emit(const DesktopNotesSaveFailed());
    }
    await _repository.saveNote(event.note!.title,event.note!.description).whenComplete( () => _onGet(DesktopGetNotesEvent(), emit));
    
  }

  void _onDelete(DeleteNoteEvent event,Emitter<DesktopNotesState> emit) async {
    try{
      if(event.index == null){
        emit(const DesktopNotesDeleteFailed());
      }
      else{
        await _repository.deleteNote(event.index!).whenComplete( () => _onGet(DesktopGetNotesEvent(), emit));
       
      }
    }
    catch(e){
      debugPrint(e.toString());
      emit (const DesktopNotesDeleteFailed());
    }
  }

  void _onUpdate(UpdateNoteEvent event,Emitter<DesktopNotesState> emit) async {
    try{
    // debugPrint('Хз вроде не работаю'+' ${event.note}'+' ${event.index}');
    await _repository.updateNote(event.index!,event.description!).whenComplete( () => _onGet(DesktopGetNotesEvent(), emit));     
    //debugPrint('Хз вроде работаю');
    }
    catch(e){
      debugPrint(e.toString());
      emit (const DesktopNotesUpdateFailed());
    }
  }

  void _onUpdateText(UpdateTextEvent event, Emitter<DesktopNotesState> emit){

    emit(DesktopNotesTextUpdated(event.newText));

  }

}
