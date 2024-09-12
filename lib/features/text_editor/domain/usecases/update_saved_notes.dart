// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:base/core/usecases.dart';
import 'package:base/features/text_editor/domain/entity/note_entity.dart';
import 'package:base/features/text_editor/domain/repository.dart';

class UpdateSavedNotesUsecase extends UseCase<void,UpdateParams>{
  final NotesRepository _notesRepository;

  UpdateSavedNotesUsecase(this._notesRepository);

  
  @override
  Future<void> call({required UpdateParams params}) {
    
    return _notesRepository.updateNote(params.index,params.note.description);
  }

}

class UpdateParams {//не уверен
  NoteEntity note;
  int index;
  UpdateParams({
    required this.note,
    required this.index,
  });
  
}
