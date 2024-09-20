part of 'qr_bloc.dart';

class QrState {}

final class QrInitial extends QrState {}

class QRScanComplete extends QrState{
  String data;
  NoteModel note;
  QRScanComplete(this.data,this.note);
}

class QRFailure extends QrState {

}

class QrSaveComplete extends QrState {

}
