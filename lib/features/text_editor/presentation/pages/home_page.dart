import 'package:base/features/text_editor/data/datasource/local/hive_db.dart';
import 'package:base/features/text_editor/presentation/bloc/bloc/local/notes_bloc.dart';
import 'package:base/features/text_editor/presentation/widgets/mobile/mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
    
class HomePage extends StatelessWidget {

  const HomePage({ super.key });
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: BlocBuilder<LocalNotesBloc, LocalNotesState>(
        builder: (context, state) {
          return CustomScrollView(
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
              BlocBuilder<LocalNotesBloc, LocalNotesState>(
                builder: (context, state) {
                  if (state is LocalNotesLoading) {
                    return const SliverToBoxAdapter(
                      child: Center(child: CupertinoActivityIndicator()),
                    );
                  } else if (state is LocalNotesDone) {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, '/editorPage');
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
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: const Icon(Icons.download),
      ),
    );
  }
}


