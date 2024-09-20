import 'package:base/bloc/notes_bloc/notes_bloc.dart';
import 'package:base/data/models/note_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditingPlace extends StatelessWidget {
  const EditingPlace({
    super.key,
    required TextEditingController descriptionController,
    required TextEditingController titleController,
    required TextEditingController indexController,
    required TextEditingController passwordController
  }) : _descriptionController = descriptionController, _titleController = titleController, _indexController = indexController, _passwordController = passwordController;
  final TextEditingController _descriptionController;
  final TextEditingController _passwordController;
  final TextEditingController _titleController;
  final TextEditingController _indexController;

  @override
  Widget build(BuildContext context) {
    return BlocListener<NotesBloc, NotesState>(
      listener: (context, state){
        if(state is NotesTextUpdated){
          _descriptionController.text = state.updatedText;
        }
      },
      child: Expanded(
        child: Container(
          margin: const EdgeInsets.only(top: 10,bottom: 60, right: 120,left: 120),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black)
          ),
          child: Column(
            children: [ 
              Container(
                decoration:const BoxDecoration(
                  border: Border(bottom: BorderSide(color:Colors.black)),
                  borderRadius: BorderRadius.only(
                    topLeft:Radius.circular(20) ,
                    topRight:Radius.circular(20) 
                    )
                ),
                height: MediaQuery.of(context).size.height/20,
                child: TextField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  readOnly: true,
                  controller: _titleController,
                  textAlign: TextAlign.center,
                  ),
              
              ),
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
                BlocBuilder<NotesBloc,NotesState>(
                  builder: (context,state) {
                    return Container( //Кнопка чтоб сохранить 
                      margin: const EdgeInsets.all(20),
                      child: ElevatedButton(
                        onPressed: (){
                          if(_titleController.text.isEmpty){
                          showDialog(
                            context: context, 
                            builder: (context)=>
                            AlertDialog(
                              title: const Text('Введите название заметки и пароль(по желанию)'),
                              content: SizedBox(
                                width: MediaQuery.of(context).size.width/5,
                                height: MediaQuery.of(context).size.height/5,
                                child: Column(
                                  children: [
                                    TextField(
                                      controller: _titleController,
                                    ),
                                    TextField(
                                      controller: _passwordController,
                                    ),
                                    TextButton(
                                      onPressed: (){                                        
                                        context.read<NotesBloc>().add(SaveNotesEvent(NoteModel(id: 0,title:_titleController.text ,description:_descriptionController.text, password: _passwordController.text)));
                                        _passwordController.clear();
                                        _titleController.clear();
                                        _descriptionController.clear();
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
                              int id = int.tryParse(_indexController.text)!;
                              context.read<NotesBloc>().add(UpdateNoteEvent(NoteModel(
                                id: id,
                                title: _titleController.text, 
                                description: _descriptionController.text,
                                password: state.notes![id].password)));
                              //debugPrint('Я работаю хз лол'+' $index'+' $description');
                            }
                        }, 
                        child: const Text('Сохранить')),
                      );
                  }
                ),
                ],
                  
              ),
          ),
        ),
    );
  }
}

