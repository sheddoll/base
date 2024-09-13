import 'package:base/presentation/pages/auth/login_page.dart';
import 'package:base/presentation/pages/auth/signup_page.dart';
import 'package:base/presentation/pages/mobile/editor_page.dart';
import 'package:base/presentation/pages/mobile/home_page.dart';
import 'package:base/presentation/pages/desktop/desktop_home_page.dart';
import 'package:base/presentation/pages/mobile/settings_page.dart';
import 'package:flutter/material.dart';


Map<String,WidgetBuilder> routes = {
  '/homePage' : (context) => const HomePage(),
  '/editorPage' : (context)=>EditorPage(),
  '/settingsPage' : (context)=>const SettingsPage(),
  '/loginPage' : (context)=>const LoginPage(),
  '/signupPage' : (context)=>const SignupPage(),
  '/desktopHomePage' : (context)=>  DesktopHomePage()
};