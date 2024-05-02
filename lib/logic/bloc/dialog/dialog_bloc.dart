import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dialog_event.dart';
part 'dialog_state.dart';

class DialogBloc extends Bloc<DialogEvent, DialogState> {
  DialogBloc() : super(DialogInitial()) {
    on<OpenDialog>((event, emit) => _openDialog(event, emit));
    on<CloseDialog>((event, emit) => _closeDialog(event, emit));
  }

  _openDialog(OpenDialog event, Emitter<DialogState> emit) {
    emit(DialogOpened(isOpened: event.isOpened));
  }

  _closeDialog(CloseDialog event, Emitter<DialogState> emit) {
    emit(DialogClosed(isClosed: event.isClosed));
  }
}
