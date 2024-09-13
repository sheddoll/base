import 'package:flutter/material.dart';

class EditorPage extends StatelessWidget {
  EditorPage({super.key});
  final TextEditingController _controller = TextEditingController(text: 'Предзаполненный текст');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Название заметки'),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushReplacementNamed(context, '/homePage');
          }, 
          
          icon: const Icon(Icons.arrow_back))
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          controller: _controller,
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