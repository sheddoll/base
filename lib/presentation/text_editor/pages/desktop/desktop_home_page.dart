import 'dart:collection';

import 'package:base/bloc/notes_bloc/notes_bloc.dart';
import 'package:base/data/models/note_model.dart';
import 'package:base/presentation/text_editor/widgets/desktop/desktop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DesktopHomePage extends StatelessWidget {
  
   DesktopHomePage({super.key});
   
   Queue<NoteModel> history = Queue<NoteModel>();
   final TextEditingController _descriptionController = TextEditingController(text: '');
   final TextEditingController _titleController = TextEditingController(text: '');
   final TextEditingController _indexController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Text('Name'), // login 
      ),
  
      body: Row(
        children: [
          Container( // Наш лист с Историей и Заметками
            width: MediaQuery.of(context).size.width/4,
            child: CustomScrollView(
          slivers:[
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    Container(
                      margin: const EdgeInsets.only(right: 30),
                      child: IconButton(
                      onPressed: (){
                        _descriptionController.text = '';
                        _titleController.text = '';
                      }, 
                      icon: const Icon(Icons.add)),
                    ),
                    ToggleButtons(
                      selectedColor: Colors.purpleAccent,
                      disabledColor: Colors.grey,
                      borderColor: Colors.transparent,
                      isSelected: [true,false],
                      children: [
                        TextButton(
                          onPressed:(){
                            context.read<NotesBloc>().add(GetNotesEvent());
                            
                          } , 
                          child: const Text('Заметки')),
                        TextButton(
                          onPressed: (){
                            // context.read<DesktopNotesBloc>().add(DesktopHistoryEvent(history));
                          },
                          child: const Text('История'))
                      ]
                    
                      )                                        
                  ],
              ),
              ),
            ),
            
            BlocBuilder<NotesBloc,NotesState>(
              builder: (context, state) {


                switch (state){
                  case NotesInitial():
                  return SliverToBoxAdapter(
                    child: SizedBox(
                      child: Container(
                        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/3),
                        child: const Text('Сохраните свою первую заметку!'),
                      ),
                    )
                    );

                  case NotesLoading():
                  return const SliverToBoxAdapter(child: CupertinoActivityIndicator());

                  case NotesFailed():
                  return const SliverToBoxAdapter(child: Text('Error'));
                  
                  case NotesLoadingDone():
                  return SliverList.builder( // List для заметок
                      itemCount: state.notes?.length ?? 0,
                      itemBuilder: (context, index)=>
                      GestureDetector(
                        onDoubleTap: (){
                          _indexController.text = '';
                          _titleController.text = '';
                          _descriptionController.text = '';
                          context.read<NotesBloc>().add(DeleteNoteEvent(state.notes![index]));
                        },
                        onTap: (){
                          _indexController.text = index.toString();
                          _titleController.text = state.notes![index].title;
                          _descriptionController.text = state.notes![index].description;
                        },
                        child: BaseDesktopContainer(note: state.notes![index],),
                      ),
                    );

                  /*case DesktopGetHistory():
                    if(history.isEmpty){
                      return const SliverToBoxAdapter();
                    }
                    else{
                      return SliverList.builder(
                        itemCount: history.length,
                        itemBuilder: (context, index)=>
                        GestureDetector(
                          onTap:() {
                            _indexController.text = index.toString();
                            _titleController.text = state.notes![index].title;
                            context.read<DesktopNotesBloc>().add(UpdateTextEvent(state.notes?[index].description ?? ''));
                          },
                        child: BaseDesktopContainer(note: history.elementAt(index)),
                        )
                      
                      );
                    }*/

                  default: 
                  return const SliverToBoxAdapter(child: Text('Error'));
                  }
                }),
            ],
          ),
        ),
        BlocListener<NotesBloc, NotesState>(
          listener: (context, state){
            if(state is NotesTextUpdated){
              _descriptionController.text = state.updatedText;
            }
          },
          child: Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 120, vertical: 60),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black)
              ),
              child: Column(
                children: [
                  Expanded( //Текостовое поле
                    child: Container(
                      margin: const EdgeInsets.all(30),
                      child: TextField(
                        controller: _descriptionController,
                        autocorrect: true,
                        maxLines: null,
                        decoration: const InputDecoration(
                          border: InputBorder.none
                        ),
                      
                      ),
                    )
                    ),
          
                  
                    Container( //Кнопка чтоб сохранить 
                    margin: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      onPressed: (){
                        if(_titleController.text == ''){
                        showDialog(
                          context: context, 
                          builder: (context)=>
                          AlertDialog(
                            title: const Text('Введите название заметки'),
                            content: Container(
                              width: MediaQuery.of(context).size.width/5,
                              height: MediaQuery.of(context).size.height/5,
                              child: Column(
                                children: [
                                  TextField(
                                    controller: _titleController,
                                  ),
                                  TextButton(
                                      onPressed: (){                                        
                                        context.read<NotesBloc>().add(SaveNotesEvent(NoteModel(id: 0,title:_titleController.text ,description:_descriptionController.text)));
                                        _titleController.text = '';
                                        Navigator.of(context).pop();
                                      }, 
                                      child: const Text('Подтвердить')
                                      ),
                                ],
                              ),
                            ),
                          )
                          );
                          }
                          else{
                            context.read<NotesBloc>().add(UpdateNoteEvent(NoteModel(
                              id: int.tryParse(_indexController.text)!,
                              title: _titleController.text, 
                              description: _descriptionController.text)));
                            //debugPrint('Я работаю хз лол'+' $index'+' $description');
                          }
                      }, 
                      child: const Text('Сохранить')),
                  ),
                  
                ],
              ),
            ),
          ),
        )
      ]
      ),
      endDrawer: Drawer( //Меню настроек
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Text('Настройки'),
            ),
            ListTile(
              title: const Text('Выход', style: TextStyle(color: Colors.red),),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/loginPage');
              },
            ),
          ],
        ),
      ),
    );
  }
}