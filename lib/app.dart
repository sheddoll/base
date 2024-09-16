import 'package:base/bloc/desktop/notes_bloc.dart';
import 'package:base/core/routes.dart';
import 'package:base/core/theme.dart';
import 'package:base/injection_container.dart.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:flutter_bloc/flutter_bloc.dart';

class BaseApp extends StatelessWidget {
  const BaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotesBloc>(
      create: (context)=> sl()..add(GetNotesEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        routes: routes,
        initialRoute: Platform.isAndroid || Platform.isIOS ? '/signupPage' : '/desktopHomePage',
      ),
    );
  }
}
