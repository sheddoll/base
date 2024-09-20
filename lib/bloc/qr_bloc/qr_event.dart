part of 'qr_bloc.dart';

class QrEvent {}

class QRScanEvent extends QrEvent{

}

class SaveViaQr extends QrEvent{
  NoteModel note;
  SaveViaQr(this.note);
}