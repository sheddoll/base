import 'dart:io';
import 'package:base/bloc/auth_bloc/bloc/auth_bloc.dart';
import 'package:base/data/models/user_model.dart';
import 'package:base/presentation/auth/widget/base_auth_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  final TextEditingController _emailController = TextEditingController(text: '');
  final TextEditingController _passwordController = TextEditingController(text: '');
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
              child: BlocConsumer<AuthBloc,AuthState>(
                listener: (context,state){
                  if(state is SignUpSuccess){
                    showDialog(
                      context: context, 
                      builder: (context) =>
                      const AlertDialog(
                        content: SizedBox(
                          width: 50,
                          height: 25,
                          child: Center(
                            child: Text('Подтвердите email')),
                        ),
                      )
                    ); 
                  }
                  if(state is AuthFailure){
                    showDialog(
                      context: context, 
                      builder: (context) =>
                      const AlertDialog(
                        content: SizedBox(
                          width: 50,
                          height: 25,
                          child: Center(
                            child: Text('Ошибка регистрации')),
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
                            context.read<AuthBloc>().add(SignUpEvent(user: UserModel(email: _emailController.text, password: _passwordController.text)));
                          }, 
                          child: const Text('Зарегестрироваться')
                          ),
                        TextButton(
                          onPressed: (){
                            Navigator.pushReplacementNamed(context,'/loginPage');
                          },
                          child: const Text('Вход?')
                        ),
                      ],
                    );
                  }
                  if(state is AuthLoading){
                    return const CupertinoActivityIndicator();
                  }
                  return const SizedBox.shrink();
                  
                  
                }),
            ),
          ),
        ],
      )
    );
  }
}