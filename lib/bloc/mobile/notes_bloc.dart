
import 'package:base/data/models/note_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class LocalNotesBloc extends Bloc<LocalNotesEvent, LocalNotesState> {

 

  LocalNotesBloc(
    ) : super(const LocalNotesLoading()) {

   // on<SaveNotesEvent>(_onSave); 
    //on<DeleteNoteEvent>(_onDelete);
    //on<GetNotesEvent>();
   
  }

 

}


