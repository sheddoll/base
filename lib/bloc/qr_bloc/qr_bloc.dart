
import 'package:base/data/models/note_model.dart';

import 'package:base/domain/notes_repository.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'qr_event.dart';
part 'qr_state.dart';

class QrBloc extends Bloc<QrEvent, QrState> {
  final NotesRepository _repository;
  QrBloc(this._repository) : super(QrInitial()) {
    on<QRScanEvent>(_onQRScan);
    on<SaveViaQr>(_onSaveViaQr);
  }

  _onQRScan(QRScanEvent event, Emitter emit) async {
    try{
      final qrCode = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.QR);
      NoteModel note = NoteModel.fromString(qrCode);
      emit(QRScanComplete(qrCode, note));
    }
    
    catch(e){
      emit(QRFailure());
      debugPrint(e.toString());
    }

  }

  _onSaveViaQr(SaveViaQr event, Emitter emit) async{
    try{
      await _repository.localSaveNote(event.note);
      await _repository.remoteSaveNote(event.note);
      emit(QrSaveComplete());

    }
    catch(e){
      emit(QRFailure());
      debugPrint(e.toString());
    }

  }
}
