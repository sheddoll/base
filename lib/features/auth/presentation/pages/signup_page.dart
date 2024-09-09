import 'dart:io';
import 'package:base/features/auth/presentation/widgets/auth_widgets.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Stack(
        children: [
          
          Platform.isAndroid || Platform.isIOS ?  AppBar(
            title: const Text('SignUp'),
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
                  child: const Text('Зарегистрироваться')
                  ),
                TextButton(
                  onPressed: (){}, 
                  child: const Text('Вход')
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