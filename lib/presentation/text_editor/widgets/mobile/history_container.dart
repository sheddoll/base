import 'package:flutter/material.dart';

class HistoryMobileContainer extends StatelessWidget { // заготовка под истории заметок
  const HistoryMobileContainer({super.key,});
  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
      padding: const EdgeInsets.all(10),
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white70,
        border: Border.all(color: Colors.black)
      ),

      child: const Center(
        child: Text('Название заметки'),
      ),
    );
  }
}