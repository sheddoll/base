import 'package:base/presentation/text_editor/widgets/desktop/drawer.dart';
import 'package:base/presentation/text_editor/widgets/desktop/editing_place.dart';
import 'package:base/presentation/text_editor/widgets/desktop/notes_place.dart';
import 'package:flutter/material.dart';


class DesktopHomePage extends StatelessWidget { // разбить на лево и право 
  
   DesktopHomePage({super.key});
   
   final TextEditingController _descriptionController = TextEditingController(text: '');
   final TextEditingController _titleController = TextEditingController(text: '');
   final TextEditingController _indexController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Text('Base'), // login 
      ),
  
      body: Row(
        children: [
          SizedBox( // Наш лист с Историей и Заметками
            width: MediaQuery.of(context).size.width/4,
            child: NotesPlace(indexController: _indexController, descriptionController: _descriptionController, titleController: _titleController),
        ),
        EditingPlace(descriptionController: _descriptionController, titleController: _titleController, indexController: _indexController)
      ]
      ),
      endDrawer: DesktopDrawer(),
    );
  }
}