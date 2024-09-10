import 'package:base/features/text_editor/presentation/widgets/mobile/mobile.dart';
import 'package:flutter/material.dart';
    
class HomePage extends StatelessWidget {

  const HomePage({ super.key });
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: buildAppBar(context),
      body:CustomScrollView(
        slivers:[
          const MobileParagraphContainer(child:Text('История')),
            SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
              child: ListView.builder( //ListView для истории просмотра(Историю сделаю с помощью Queue)
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index)=> 
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacementNamed(context, '/editorPage');
                      },
                    child: HistoryMobileContainer(), 
                    )
                ),
              ),
            ),
          const MobileParagraphContainer(child:Text('Заметки')),
          SliverList.builder( // List для заметок
            itemCount: 15,
            itemBuilder: (context, index)=> 
            GestureDetector( 
              onTap: (){
                Navigator.pushReplacementNamed(context, '/editorPage');
                },
              child: BaseMobileContainer(),
              ),
            ),
        ]  
      ),
      

      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(Icons.download),
        ),
    );
  }
}

