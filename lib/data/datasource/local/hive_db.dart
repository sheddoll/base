import 'package:base/data/models/note_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HiveDatabase {
  final box = Hive.openBox('notes');
  
  Future<void> saveNoteLocal(NoteModel note) async{
    try{
    if(note.title.isEmpty){ return;}
    if(!Hive.isAdapterRegistered(1)){
      Hive.registerAdapter(NoteModelAdapter());
    }
    final box = await Hive.openBox<NoteModel>('notes_box');
    List<int> keys = box.keys.cast<int>().toList();  //Можно сделать проще
    if(box.containsKey(note.id)){
      int newKey = 0;
      while(keys.contains(newKey)){
        newKey++;
      }
      note.id = newKey;
    }
    await box.put(note.id,note);
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
      await box.delete(note.id);
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
      
      return notes;
    }
    catch(e){
      debugPrint(e.toString());
      return [];
    }
    }

  Future<void> updateNoteLocal(NoteModel note)async{  //Вместо войд можно возвращать bool для обратной связи
    try{
    if(!Hive.isAdapterRegistered(1)){
      Hive.registerAdapter(NoteModelAdapter());
    }
    final box = await Hive.openBox<NoteModel>('notes_box');
    //print('ээээээээ'); //проверить
    if(box.isEmpty){
      return;
    }  
    await box.putAt(note.id,note);
    }
    catch(e){
      debugPrint(e.toString());
      return;
    }
    //print (note.description + note.title);
  }
    
  Future<void> clearBox() async{
    try{
      if(!Hive.isAdapterRegistered(1)){
      Hive.registerAdapter(NoteModelAdapter());
    }
    await Hive.deleteBoxFromDisk('notes_box');
    }
    catch(e){
      debugPrint(e.toString());
      return;
    }
    
  }
  
} 
