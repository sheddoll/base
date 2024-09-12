import 'package:base/features/text_editor/domain/entity/note_entity.dart';
import 'package:flutter/material.dart';



Widget baseMobileContainer(BuildContext context, NoteEntity entity) { // заготовка под заметку
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
        Text(entity.title),
        Icon(Icons.remove_red_eye)
      ],
    )
  );
}


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

class MobileParagraphContainer extends StatelessWidget { //Отступы
  const MobileParagraphContainer({
    super.key,
    required this.child
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return  SliverToBoxAdapter(
      child: SizedBox(
        height: 20,
        child: Center(
          child: child,),
      )
    );
  }
}

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