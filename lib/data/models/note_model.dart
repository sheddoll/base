import 'package:hive/hive.dart';
part 'note_model.g.dart';

@HiveType(typeId: 1)
class NoteModel extends HiveObject{
  
  @HiveField(0)
  final String  title;
  @HiveField(1)
  String  description;

  NoteModel({required this.title, required this.description});


  factory NoteModel.fromJson(Map<String, dynamic> json){
    return NoteModel(
      title: json['title'],
      description: json['description'],
    );
  }
}
