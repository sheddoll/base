import 'package:base/core/usecases.dart';
import 'package:base/features/text_editor/domain/entity/note_entity.dart';
import 'package:base/features/text_editor/domain/repository.dart';

class GetSavedNotesUsecase extends UseCase<List<NoteEntity>,void>{
  final NotesRepository _notesRepository;

  GetSavedNotesUsecase(this._notesRepository);

  

  @override
  Future<List<NoteEntity>> call({params}) {
    return _notesRepository.getSavedNotes();
  }

}