import 'package:flutter/material.dart';

class EditorPage extends StatelessWidget {
  const EditorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TileName'),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back))
        ],
      ),
      body: TextField(
        //TODO сделать текстовый редактор для десктопа и просмотр для мобилок
      )


    );
  }
}