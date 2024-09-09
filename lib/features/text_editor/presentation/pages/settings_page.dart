import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки'),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back))
        ],
      ),
      floatingActionButton: TextButton(onPressed: (){}, child: const Text('Выйти из аккаунта?')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}