import 'package:base/bloc/notes_bloc/notes_bloc.dart';
import 'package:base/presentation/text_editor/widgets/mobile/app_bar.dart';
import 'package:base/presentation/text_editor/widgets/mobile/base_container.dart';
import 'package:base/presentation/text_editor/widgets/mobile/history_container.dart';
import 'package:base/presentation/text_editor/widgets/mobile/paragraph.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
    
class HomePage extends StatelessWidget {

  const HomePage({ super.key });
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: CustomScrollView(
            slivers: [
              const MobileParagraphContainer(child: Text('История')),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/editorPage');
                      },
                      child: const HistoryMobileContainer(),
                    ),
                  ),
                ),
              ),
              const MobileParagraphContainer(child: Text('Заметки')),
              BlocBuilder<NotesBloc, NotesState>(
                builder: (context, state) {
                  if (state is NotesLoading) {
                    return const SliverToBoxAdapter(
                      child: Center(child: CupertinoActivityIndicator()),
                    );
                  } else if (state is NotesLoadingDone) {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, '/editorPage', arguments: state.notes![index],);
                          },
                          child: baseMobileContainer(context, state.notes![index]),
                        ),
                        childCount: state.notes?.length ?? 0,
                      ),
                    );
                  } else {
                    return const SliverToBoxAdapter(
                      child: Center(child: Text('Нет заметок')),
                    );
                  }
                },
              ),
            ],
          ),  
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: const Icon(Icons.download),
      ),
    );
  }
}


