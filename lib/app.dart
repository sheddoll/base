import 'package:base/bloc/auth_bloc/bloc/auth_bloc.dart';
import 'package:base/bloc/notes_bloc/notes_bloc.dart';
import 'package:base/core/routes.dart';
import 'package:base/core/theme.dart';
import 'package:base/injection_container.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaseApp extends StatelessWidget {
  const BaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
      BlocProvider<NotesBloc>(
        create: (context)=> sl()..add(GetNotesEvent())),
      BlocProvider<AuthBloc>(
        create: (context)=>sl()..add(LoggedInEvent())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        routes: routes,
        initialRoute: '/loginPage',
      ),
    );
  }
}
