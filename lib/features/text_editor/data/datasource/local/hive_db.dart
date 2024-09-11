
import 'package:base/features/text_editor/data/note_model.dart';
import 'package:base/features/text_editor/domain/entity/note_entity.dart';
import 'package:hive/hive.dart';

class HiveDatabase {
  
  void saveNote(String title, String description) async{
    if(title.isEmpty){ return;}
    if(!Hive.isAdapterRegistered(1)){
      Hive.registerAdapter(NoteEntityAdapter());
    }
    final box = await Hive.openBox('notes_box');
    final note = NoteModel(title: title, description: description);
    await box.add(note);
    
    
  }


  void deleteNote(int index)async{
    
    if(!Hive.isAdapterRegistered(1)){
      Hive.registerAdapter(NoteEntityAdapter());
    }
    final box = await Hive.openBox('notes_box');
    
    
    await box.deleteAt(index);
    print('удаленные' + box.values.toString());//проверить
    
  }

  Future<List> getNotes()async{
    
    if(!Hive.isAdapterRegistered(1)){
      Hive.registerAdapter(NoteEntityAdapter());
    }
    final box = await Hive.openBox('notes_box');
    List notes = [];
    notes.addAll(box.values);
    
    print('обнавленные' + box.values.toString());//проверить
    print('полученные' + notes.toString());//проверить
    return notes;
    }

  void updateNote(int index, String newDescription)async{
    
    if(!Hive.isAdapterRegistered(1)){
      Hive.registerAdapter(NoteEntityAdapter());
    }
    final box = await Hive.openBox('notes_box');
    print('сохраненные' + box.toString()); //проверить
    NoteModel note = box.getAt(index);
    note.description = newDescription;
    box.putAt(index,note);
    
  }
} 
