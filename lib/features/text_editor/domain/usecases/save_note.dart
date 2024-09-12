import 'package:base/core/usecases.dart';
import 'package:base/features/text_editor/domain/entity/note_entity.dart';
import 'package:base/features/text_editor/domain/repository.dart';

class SaveNoteUsecase extends UseCase<void,NoteEntity>{
  final NotesRepository _notesRepository;

  SaveNoteUsecase(this._notesRepository);

  

  @override
  Future<void> call({required NoteEntity params}) {
    return _notesRepository.saveNote(params.title, params.description);
  }

}