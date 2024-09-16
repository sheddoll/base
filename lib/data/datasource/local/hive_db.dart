
import 'package:base/data/models/note_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HiveDatabase {
  
  Future<void> saveNoteLocal(String title, String description) async{
    try{
    if(title.isEmpty){ return;}
    if(!Hive.isAdapterRegistered(1)){
      Hive.registerAdapter(NoteModelAdapter());
    }
    final box = await Hive.openBox<NoteModel>('notes_box');
    final note = NoteModel(title: title, description: description);
    await box.add(note);
    }
    catch(e){
      debugPrint(e.toString());
    }
    
  }


  Future<void> deleteNoteLocal(int index)async{
     try{
      if(!Hive.isAdapterRegistered(1)){
        Hive.registerAdapter(NoteModelAdapter());
      }
      final box = await Hive.openBox<NoteModel>('notes_box');
      await box.deleteAt(index);
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

  Future<void> updateNoteLocal(int index, String newDescription)async{
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
    NoteModel note = box.getAt(index)!;
    note.description = newDescription;
    await box.putAt(index,note);
    }
    }
    catch(e){
      debugPrint(e.toString());
      return;
    }
    //print (note.description + note.title);
    
    
  }
} 
