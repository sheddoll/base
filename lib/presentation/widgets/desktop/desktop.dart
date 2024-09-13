import 'package:flutter/material.dart';

class BaseDesktopContainer extends StatelessWidget {
  const BaseDesktopContainer({super.key,});
  

  @override
  Widget build(BuildContext context) { // заготовка под заметку
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
      padding: const EdgeInsets.all(10),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white70,
      ),

      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Название заметки'),
          Icon(Icons.remove_red_eye)
        ],
      )
    );
  }
}