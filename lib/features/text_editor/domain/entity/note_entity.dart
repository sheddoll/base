import 'package:hive/hive.dart';

part 'note_entity.g.dart';

@HiveType(typeId: 1)
class NoteEntity extends HiveObject{
  
  @HiveField(0)
  final String  title;
  @HiveField(1)
  final String  description;

  NoteEntity({required this.title, required this.description});
}

