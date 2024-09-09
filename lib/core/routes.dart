import 'package:base/features/auth/presentation/pages/login_page.dart';
import 'package:base/features/auth/presentation/pages/signup_page.dart';
import 'package:base/features/text_editor/presentation/pages/editor_page.dart';
import 'package:base/features/text_editor/presentation/pages/home_page.dart';
import 'package:base/features/text_editor/presentation/pages/settings_page.dart';
import 'package:flutter/material.dart';


Map<String,WidgetBuilder> routes = {
  '/homePage' : (context) => const HomePage(),
  '/editorPage' : (context)=>const EditorPage(),
  '/settingsPage' : (context)=>const SettingsPage(),
  '/loginPage' : (context)=>const LoginPage(),
  '/signupPage' : (context)=>const SignupPage(),
};