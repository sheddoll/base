import 'package:base/data/models/note_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseDatabase {

  final SupabaseClient supabase = Supabase.instance.client;

  Future<List<NoteModel>> getNotes() async {
    
    try{
      final response = await supabase.from('notes').select();
      return response.map((note) => NoteModel.fromJson(note)).toList();
    }
    catch(e){
      debugPrint(e.toString());
      return [];
    }
  }

  Future<void> addNote(String title, String description) async {
    try{
      await supabase
        .from('notes')
        .insert({'title': title, 'description': description});
    }
    catch(e){
      debugPrint(e.toString());
      return;
    }
  }

  // Обновление заметки
  Future<void> updateNote(String id, String title, String description) async {
    try{
      await supabase
        .from('notes')
        .update({'title': title, 'description': description})
        .eq('id', id);
    }
    catch(e){
      debugPrint(e.toString());
      return;
    }
  }

  // Удаление заметки
  Future<void> deleteNote(String id) async {
    try{
      await supabase
        .from('notes')
        .delete()
        .eq('id', id);
    }
    catch(e){
      debugPrint(e.toString());
      return;
    }
  }
}