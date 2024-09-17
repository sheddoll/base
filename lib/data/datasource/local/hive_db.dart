import 'package:base/data/models/note_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HiveDatabase {
  
  Future<void> saveNoteLocal(NoteModel note) async{
    try{
    if(note.title.isEmpty){ return;}
    if(!Hive.isAdapterRegistered(1)){
      Hive.registerAdapter(NoteModelAdapter());
    }
    final box = await Hive.openBox<NoteModel>('notes_box');
    await box.putAt(note.id,note);
    }
    catch(e){
      debugPrint(e.toString());
    }
    
  }


  Future<void> deleteNoteLocal(NoteModel note)async{
     try{
      if(!Hive.isAdapterRegistered(1)){
        Hive.registerAdapter(NoteModelAdapter());
      }
      final box = await Hive.openBox<NoteModel>('notes_box');
      await box.deleteAt(note.id);
      //print('удаленные' + box.values.toString());//проверить
    }
    catch(e){
      debugPrint(e.toString());
      
    }
  }

  Future<List<NoteModel>> getNotesLocal()async{
    try{
      if(!Hive.isAdapterRegistered(1)){
        Hive.registerAdapter(NoteModelAdapter());
      }

      final box = await Hive.openBox<NoteModel>('notes_box');

      List<NoteModel> notes = [];
      notes.addAll(box.values);
      
      //print('обнавленные' + box.values.toString());//проверить
      //print('полученные' + notes.toString());//проверить
      return notes;
    }
    catch(e){
      debugPrint(e.toString());
      return [];
    }
    }

  Future<void> updateNoteLocal(NoteModel newNote)async{
    try{
    if(!Hive.isAdapterRegistered(1)){
      Hive.registerAdapter(NoteModelAdapter());
    }
    final box = await Hive.openBox<NoteModel>('notes_box');
    //print('ээээээээ'); //проверить
    if(box.isEmpty){
      return;
    }
    else{
    NoteModel note = box.getAt(newNote.id)!;
    note.description = newNote.description;
    await box.putAt(note.id,note);
    }
    }
    catch(e){
      debugPrint(e.toString());
      return;
    }
    //print (note.description + note.title);
  }
    
  
  
} 
