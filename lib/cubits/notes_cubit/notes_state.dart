part of 'notes_cubit.dart';

@immutable
sealed class NotesState {}

final class NotesInitial extends NotesState {}

final class NotesLoadingState extends NotesState {}

final class NotesSuccessState extends NotesState {
  final List<NoteModel> notes;
  NotesSuccessState(this.notes);
}

final class NotesFailureState extends NotesState {
  final String errMessage;

  NotesFailureState(this.errMessage);
}
