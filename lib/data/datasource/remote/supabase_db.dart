import 'package:base/data/models/note_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseDatabase {

  final SupabaseClient supabase = Supabase.instance.client;

  Future<List<NoteModel>> getNotes() async {
    
    try{
      final response = await supabase.from('notes').select().eq('email', supabase.auth.currentUser!.email!);
      return response.map((note) => NoteModel.fromJson(note)).toList();
    }
    catch(e){
      debugPrint(e.toString());
      return [];
    }
  }

  Future<void> addNote(NoteModel note) async {
    try{
      await supabase
        .from('notes')
        .insert(
          {
            'id':note.id, 
            'email' : supabase.auth.currentUser!.email,
            'title': note.title, 
            'description': note.description
          });
    }
    catch(e){
      debugPrint(e.toString());
      return;
    }
  }

  // Обновление заметки
  Future<void> updateNote(NoteModel note) async {
    try{
      await supabase
        .from('notes')
        .update({'description': note.description})
        .eq('id', note.id)
        .eq('email', supabase.auth.currentUser!.email!);
    }
    catch(e){
      debugPrint(e.toString());
      return;
    }
  }

  // Удаление заметки
  Future<void> deleteNote(NoteModel note) async {
    try{
      await supabase
        .from('notes')
        .delete()
        .eq('email',supabase.auth.currentUser!.email! )
        .eq('id', note.id);
    }
    catch(e){
      debugPrint(e.toString());
      return;
    }
  }

  
}