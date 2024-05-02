part of 'dialog_bloc.dart';

abstract class DialogState extends Equatable {
  const DialogState();

  @override
  List<Object> get props => [];
}

class DialogInitial extends DialogState {}

class DialogOpened extends DialogState {
  final bool isOpened;
  const DialogOpened({required this.isOpened});

  @override
  List<Object> get props => [isOpened];
}

class DialogClosed extends DialogState {
  final bool isClosed;
  const DialogClosed({required this.isClosed});

  @override
  List<Object> get props => [isClosed];
}
