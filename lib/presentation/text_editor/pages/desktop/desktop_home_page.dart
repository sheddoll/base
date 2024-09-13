import 'package:base/bloc/desktop/desktop_notes_bloc.dart';
import 'package:base/presentation/text_editor/widgets/desktop/desktop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DesktopHomePage extends StatelessWidget {
   DesktopHomePage({super.key});
   bool isHistory = false;
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
                    
                    TextButton(
                        onPressed: (){
                          isHistory = !isHistory;
                        }, 
                        child: Text( isHistory ? 'Заметки': 'История')),
                    
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
                      onTap: (){
                        },
                      child: const BaseDesktopContainer(),
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

        Expanded(
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
                    child: const TextField(
                      autocorrect: true,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: InputBorder.none
                      ),
                    
                    ),
                  )
                  ),

                Container( //Кнопка чтоб сохранить 
                  margin: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    onPressed: (){ //if(name!=null){save} else{
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
                                const TextField(),
                                TextButton(
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  }, 
                                  child: const Text('Подтвердить')
                                  )
                              ],
                            ),
                          ),
                        )
                        );
                    }, 
                    child: const Text('Сохранить')),
                )
              ],
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