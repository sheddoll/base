import 'package:base/core/routes.dart';
import 'package:base/core/theme.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class BaseApp extends StatelessWidget {
  const BaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      routes: routes,
      initialRoute: Platform.isAndroid || Platform.isIOS ? '/signupPage' : '/desktopHomePage',
    );
  }
}
