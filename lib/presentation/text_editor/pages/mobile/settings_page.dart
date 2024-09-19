import 'package:base/bloc/auth_bloc/bloc/auth_bloc.dart';
import 'package:base/bloc/notes_bloc/notes_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: ListView(
        children: [
           ListTile(
              title: const Text('Очистить данные?', style: TextStyle(color: Colors.red),),
              onTap: () => context.read<NotesBloc>().add(ClearAllNotesEvent()),
            ),
        ],
      ),
      floatingActionButton: TextButton(onPressed: (){
        context.read<NotesBloc>().add(LocalClearNotesEvent());
        context.read<AuthBloc>().add(LogOutEvent());
        Navigator.pushReplacementNamed(context, '/loginPage');
      }, 
      child: const Text('Выйти из аккаунта?')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}