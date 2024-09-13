import 'package:base/bloc/desktop/desktop_notes_bloc.dart';
import 'package:base/data/models/note_model.dart';
import 'package:base/presentation/text_editor/widgets/desktop/desktop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DesktopHomePage extends StatelessWidget {
  
   DesktopHomePage({super.key});
   bool isHistory = false;
   TextEditingController _descriptionController = TextEditingController(text: '');
   TextEditingController _titleController = TextEditingController(text: '');
   TextEditingController _indexController = TextEditingController();
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
                        onPressed: (){}, 
                        icon: const Icon(Icons.download)),
                    ),
                    IconButton(
                      onPressed: (){
                        _descriptionController.text = '';
                        _titleController.text = '';
                      }, 
                      icon: const Icon(Icons.add)),
                    TextButton(
                        onPressed: (){
                          isHistory = !isHistory;
                        }, 
                        child: Text( isHistory ? 'Заметки' : 'История')),
                    
                  ],
              ),
              ),
            ),
            
            BlocBuilder<DesktopNotesBloc,DesktopNotesState>(
              builder: (context, state) {
                if(state is DesktopNotesLoading){
                  return const SliverToBoxAdapter(child: CupertinoActivityIndicator());
                }
                if(state is DesktopNotesLoadingDone){
                  return SliverList.builder( // List для заметок
                    itemCount: state.notes?.length ?? 0,
                    itemBuilder: (context, index)=>
                    GestureDetector(
                       onDoubleTap: (){
                          context.read<DesktopNotesBloc>().add(DeleteNoteEvent(index));
                        
                      },
                      onTap: (){
                        _indexController.text = index.toString();
                        _titleController.text = state.notes![index].title;
                        context.read<DesktopNotesBloc>().add(UpdateTextEvent(state.notes?[index].description ?? ''));
                        context.read<DesktopNotesBloc>().add(DesktopGetNotesEvent());
                      },
                      child: BaseDesktopContainer(note: state.notes![index],),
                    ),
                  );
                }
                if(state is DesktopNotesLoadingFailed){
                  return const SliverToBoxAdapter(child: Text('Error'));
                }
                else{
                  return const SliverToBoxAdapter(child: Text('Error'));
                }
              },
                
            ),
            ],
          ),
        ),
        BlocListener<DesktopNotesBloc, DesktopNotesState>(
          listener: (context, state){
            if(state is DesktopNotesTextUpdated){
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
                                      context.read<DesktopNotesBloc>().add(SaveNotesEvent(NoteModel(title:_titleController.text ,description:_descriptionController.text)));
                                      _titleController.text = '';
                                      Navigator.of(context).pop();
                                    }, 
                                    child: const Text('Подтвердить')
                                    )
                                ],
                              ),
                            ),
                          )
                          );
                          }
                          else{
                            context.read<DesktopNotesBloc>().add(UpdateNoteEvent(int.tryParse(_indexController.text)!,_descriptionController.text));
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