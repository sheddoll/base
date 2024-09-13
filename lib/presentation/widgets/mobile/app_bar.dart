import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    title: const Text('Name'), // login 
    actions: [
      
      IconButton(onPressed: (){
        Navigator.pushReplacementNamed(context, '/settingsPage');
      }, 
      icon: const Icon(Icons.settings))
    ],
  );
}