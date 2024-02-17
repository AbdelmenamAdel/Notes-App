import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  int currentIndex = 0;
  //! Get Color
  Color getColor(index) {
    switch (index) {
      case 0:
        return const Color(0xff456990);
      case 1:
        return Colors.blue;
      case 2:
        return const Color(0xffE4FDE1);
      case 3:
        return const Color(0xffF45B69);
      case 4:
        return const Color(0xff6B2737);
      case 5:
        return const Color(0xffFF6542);
      case 6:
        return const Color(0xffFF1443);
      case 7:
        return const Color(0xff88498F);
      case 8:
        return const Color(0xff779FA1);
      case 9:
        return const Color(0xffE0CBA8);
      case 10:
        return Colors.cyan;
      default:
        return Colors.cyan;
    }
  }

  //! Change CheckMark Index
  void changeCheckMarkIndex(index) {
    currentIndex = index;
  }

  Color color = const Color(0xff114B5F);
  addNote(NoteModel note) async {
    note.color = color.value;
    emit(AddNoteLoadingState());
    try {
      Box<NoteModel> notesBox = Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(note);
      emit(AddNoteSuccessState());
    } catch (e) {
      emit(AddNoteFailureState(e.toString()));
    }
  }
}
