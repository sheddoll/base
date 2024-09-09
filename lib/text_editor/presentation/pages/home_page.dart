import 'package:base/text_editor/presentation/widgets/mobile/home_page_mobile.dart';
import 'package:flutter/material.dart';
    
class HomePage extends StatelessWidget {

  const HomePage({ super.key });
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Name'),
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
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index)=> 
                  RecentlyMobileContainer()
                ),
              ),
            ),
          const SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
            child: Center(
              child: Text('Заметки')),),
          ),
          SliverList.builder(
            itemCount: 15,
            itemBuilder: (context, index)=> 
            BaseMobileContainer(),
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