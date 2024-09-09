import 'package:base/features/text_editor/presentation/widgets/mobile/home_page_mobile.dart';
import 'package:flutter/material.dart';
    
class HomePage extends StatelessWidget {

  const HomePage({ super.key });
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Name'), // login 
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.settings))
        ],
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
              child: Center(
                child: Text('История')),),
            ),
            SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
              child: ListView.builder( //ListView для истории просмотра(Историю сделаю с помощью Queue)
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index)=> 
                  GestureDetector(
                    child: HistoryMobileContainer(), 
                    )
                ),
              ),
            ),
          const SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
            child: Center(
              child: Text('Заметки')),),
          ),
          SliverList.builder( // List для заметок
            itemCount: 15,
            itemBuilder: (context, index)=> 
            GestureDetector( 
              child: BaseMobileContainer(),
              ),
            )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(Icons.download),
        ),
    );
  }
}