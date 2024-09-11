import 'package:flutter_bloc/flutter_bloc.dart';

part 'desktop_notes_event.dart';
part 'desktop_notes_state.dart';

class DesktopNotesBloc extends Bloc<DesktopNotesEvent, DesktopNotesState> {
  DesktopNotesBloc() : super(DesktopNotesInitial()) {
    on<DesktopNotesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
