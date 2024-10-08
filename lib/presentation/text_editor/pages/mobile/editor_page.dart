import 'package:base/data/models/note_model.dart';
import 'package:flutter/material.dart';

class EditorPage extends StatelessWidget {
  const EditorPage({super.key});
  
 

  @override
  Widget build(BuildContext context) {
    final NoteModel note = ModalRoute.of(context)!.settings.arguments as NoteModel;
    final TextEditingController controller = TextEditingController(text: note.description);
    return Scaffold(
      appBar: AppBar(
        title: Text(note.title),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushReplacementNamed(context, '/homePage');
          }, 
          
          icon: const Icon(Icons.arrow_back))
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          controller: controller,
          maxLines: null,
          readOnly: true,
          decoration: const InputDecoration(
            border: InputBorder.none
          ),
        
        ),
      )


    );
  }
}