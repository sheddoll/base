
import 'package:base/data/models/note_model.dart';
import 'package:flutter/material.dart';



Widget baseMobileContainer(BuildContext context, NoteModel note) { // заготовка под заметку
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
    padding: const EdgeInsets.all(10),
    height: 40,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white70,
    ),

    child:  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(note.title),
      ],
    )
  );
}






