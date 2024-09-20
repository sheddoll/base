import 'package:base/data/models/note_model.dart';
import 'package:flutter/material.dart';

class BaseDesktopContainer extends StatelessWidget {
  final NoteModel note;
  const BaseDesktopContainer({super.key, required this.note});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
      padding: const EdgeInsets.all(10),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white70,
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(note.title,softWrap: false,overflow: TextOverflow.ellipsis, maxLines: 1,),
        ],
      )
    );
  }
}