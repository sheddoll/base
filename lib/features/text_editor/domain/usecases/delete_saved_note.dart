import 'package:base/core/usecases.dart';
import 'package:base/features/text_editor/domain/repository.dart';

class DeleteSavedNoteUsecase extends UseCase<void,int>{
  final NotesRepository _notesRepository;

  DeleteSavedNoteUsecase(this._notesRepository);

  

  @override
  Future<void> call({required int params}) {
    return _notesRepository.deleteNote(params);
  }

}