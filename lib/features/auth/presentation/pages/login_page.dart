import 'package:flutter/material.dart';
import 'dart:io';
import '../widgets/auth_widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
          Platform.isAndroid || Platform.isIOS ?  AppBar(
            title: const Text('LogIn'),
            centerTitle: true,
            
          ) 
          : const SizedBox(),
          Center(
            child: BaseAuthContainer(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Введите логин'
                    ),
                    ),
                const TextField(
                  obscureText: true, 
                  decoration: InputDecoration(
                    labelText: 'Введите пароль',
                  ),
                  ),
                TextButton(
                  onPressed: (){}, 
                  child: const Text('Войти')
                  ),
                TextButton(
                  onPressed: (){}, 
                  child: const Text('Регистрация')
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}

