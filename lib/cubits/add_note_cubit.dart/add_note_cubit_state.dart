part of 'add_note_cubit_cubit.dart';

sealed class AddNoteState {}

final class AddNoteInitial extends AddNoteState {}

final class AddNoteLoadingState extends AddNoteState {}

final class AddNoteSuccessState extends AddNoteState {}

final class AddNoteFailureState extends AddNoteState {
  final String errMessage;

  AddNoteFailureState(this.errMessage);
}
