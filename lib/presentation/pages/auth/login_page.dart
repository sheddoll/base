import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import '../../widgets/base_auth_widget.dart';

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
                  onPressed: (){
                    Navigator.pushReplacementNamed(context,  Platform.isAndroid || Platform.isIOS ? '/homePage' : '/desktopHomePage');
                  }, 
                  child: const Text('Войти')
                  ),
                TextButton(
                  onPressed: (){
                    Navigator.pushReplacementNamed(context,'/signupPage');
                  }, 
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

