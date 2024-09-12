import 'package:base/features/text_editor/domain/entity/note_entity.dart';
import 'package:hive/hive.dart';
part 'note_model.g.dart';

class NoteModel extends NoteEntity{
  NoteModel({
    required super.title, 
    required super.description
    });
}