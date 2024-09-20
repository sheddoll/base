import 'dart:io' show Platform;

import 'package:base/presentation/auth/pages/login_page.dart';
import 'package:base/presentation/auth/pages/signup_page.dart';
import 'package:base/presentation/text_editor/pages/mobile/editor_page.dart';
import 'package:base/presentation/text_editor/pages/mobile/home_page.dart';
import 'package:base/presentation/text_editor/pages/desktop/desktop_home_page.dart';
import 'package:base/presentation/text_editor/pages/mobile/settings_page.dart';
import 'package:flutter/material.dart';


Map<String,WidgetBuilder> routes = {
  '/homePage' : (context) => Platform.isAndroid || Platform.isIOS ? const HomePage() : DesktopHomePage(),
  '/editorPage' : (context)=> const EditorPage(),
  '/settingsPage' : (context)=> SettingsPage(),
  '/loginPage' : (context)=> LoginPage(),
  '/signupPage' : (context)=> SignupPage(),
};