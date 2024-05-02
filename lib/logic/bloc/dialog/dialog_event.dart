part of 'dialog_bloc.dart';

abstract class DialogEvent extends Equatable {
  const DialogEvent();

  @override
  List<Object> get props => [];
}

class OpenDialog extends DialogEvent {
  final bool isOpened;
  const OpenDialog({required this.isOpened});

  @override
  List<Object> get props => [isOpened];
}

class CloseDialog extends DialogEvent {
  final bool isClosed;
  const CloseDialog({required this.isClosed});

  @override
  List<Object> get props => [isClosed];
}
