import 'package:base/bloc/auth_bloc/bloc/auth_bloc.dart';
import 'package:base/data/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io' show Platform;
import '../widget/base_auth_container.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _emailController = TextEditingController(text: '');
  final TextEditingController _passwordController = TextEditingController(text: '');

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
              child: BlocConsumer<AuthBloc,AuthState>(
                listener: (context, state) {
                  if(state is LogInSuccess){
                    Navigator.pushReplacementNamed(context,  Platform.isAndroid || Platform.isIOS ? '/homePage' : '/desktopHomePage');
                  }
                  if(state is AuthFailure){
                    showDialog(
                      context: context, 
                      builder: (context) =>
                      AlertDialog(
                        content: Container(
                          width: 50,
                          height: 25,
                          child: const Center(
                            child: Text('Ошибка входа')),
                        ),
                      )
                    );                  
                  }    
                },
                builder: (context,state) {
                  if(state is AuthInitial){
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: _emailController,
                          decoration:  const InputDecoration(
                            labelText: 'Введите логин',
                            ),
                            ),
                        TextField(
                          controller: _passwordController,
                          obscureText: true, 
                          decoration: const InputDecoration(
                            labelText: 'Введите пароль',
                          ),
                          ),
                        TextButton(
                          onPressed: (){
                            context.read<AuthBloc>().add(LogInEvent(user: UserModel(email: _emailController.text, password: _passwordController.text)));
                          }, 
                          child: const Text('Войти')
                          ),
                        TextButton(
                          onPressed: (){
                            Navigator.pushReplacementNamed(context,'/signupPage');
                          },
                          child: const Text('Регистрация?')
                        ),
                      ],
                    );
                  }
                  if(state is AuthLoading){
                    return const CupertinoActivityIndicator();
                  }             
                  return const SizedBox.shrink();
                  
                  
                }),
              )
          ),
        ],
      )
    );
  }
}

