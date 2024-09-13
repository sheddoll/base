import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки'),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushReplacementNamed(context, '/homePage');
          }, icon: const Icon(Icons.arrow_back))
        ],
      ),
      floatingActionButton: TextButton(onPressed: (){
        Navigator.pushReplacementNamed(context, '/loginPage');
      }, 
      child: const Text('Выйти из аккаунта?')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}