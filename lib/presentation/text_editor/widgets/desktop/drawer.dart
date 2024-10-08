import 'package:base/bloc/auth_bloc/bloc/auth_bloc.dart';
import 'package:base/bloc/notes_bloc/notes_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DesktopDrawer extends StatelessWidget {
  bool isRemote = true;
  DesktopDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer( //Меню настроек
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Text('Настройки'),
          ),
          Row(
              children: [
                const Text('Включить удаленное хранение?'),
                BlocBuilder<NotesBloc,NotesState>(
                  builder: (context, state) {
                    return Switch(
                      thumbIcon:const WidgetStatePropertyAll(Icon(Icons.language)),
                      value: context.read<NotesBloc>().isRemote, 
                      onChanged:(value){
                        context.read<NotesBloc>().add(ToggleRemoteEvent(value));
                        },
                      );
                  }
                ),
              ],
            ),
          ListTile(
            title: const Text('Очистить данные?', style: TextStyle(color: Colors.red),),
            onTap: () => context.read<NotesBloc>().add(ClearAllNotesEvent()),
          ),
          ListTile(
            title: const Text('Выход', style: TextStyle(color: Colors.red),),
            onTap: () async {
              context.read<NotesBloc>().add(LocalClearNotesEvent());
              context.read<AuthBloc>().add(LogOutEvent());
              Navigator.pushReplacementNamed(context, '/loginPage');
            },
          ),
        ],
      ),
    );
  }
}