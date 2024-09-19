import 'package:base/bloc/notes_bloc/notes_bloc.dart';
import 'package:base/presentation/text_editor/widgets/desktop/desktop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';

class NotesPlace extends StatelessWidget {
  const NotesPlace({
    super.key,
    required TextEditingController indexController,
    required TextEditingController descriptionController,
    required TextEditingController titleController,
  }) : _indexController = indexController, _descriptionController = descriptionController, _titleController = titleController;

  final TextEditingController _indexController;
  final TextEditingController _descriptionController;
  final TextEditingController _titleController;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
                _indexController.text ='';
                _descriptionController.text = '';
                _titleController.text = '';
              }, 
              icon: const Icon(Icons.add)),
            ),
        
                                                     
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
                margin: const EdgeInsets.all(30),
                child: const Center(child: Text('Сохраните свою первую заметку!')),
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
                onLongPress: (){
                  showDialog(
                    context: context, 
                    builder: (context)=>
                    AlertDialog(
                      content: SizedBox(
                        width: MediaQuery.of(context).size.width/5,
                        height: MediaQuery.of(context).size.height/5,
                        child: Center(child: QrImageView(data: state.notes![index].toString(),))
                      ),
                    )
                  );                                                                                            
                },
                child: BaseDesktopContainer(note: state.notes![index],),
              ),
            );
    
          default: 
          return const SliverToBoxAdapter(child: Text('Error'));
          }
        }),
    ],
              );
  }
}



