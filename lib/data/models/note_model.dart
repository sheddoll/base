import 'package:hive/hive.dart';
part 'note_model.g.dart';

@HiveType(typeId: 1)
class NoteModel extends HiveObject{
  
  @HiveField(0)
  final String  title;
  @HiveField(1)
  String  description;
  @HiveField(2)
  final int id;

  NoteModel({required this.title, required this.description, required this.id});


  factory NoteModel.fromJson(Map<String, dynamic> json){
    return NoteModel(
      title: json['title'],
      description: json['description'],
      id: json['id'],
    );
  }
}
