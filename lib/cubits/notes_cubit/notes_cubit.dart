import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? notes;
  int currentIndex = 0;
  List<Color> colors = [
    const Color(0xff456990),
    Colors.blue,
    const Color(0xffE4FDE1),
    const Color(0xffF45B69),
    const Color(0xff6B2737),
    const Color(0xffFF6542),
    const Color(0xffFF1443),
    const Color(0xff88498F),
    const Color(0xff779FA1),
    const Color(0xffE0CBA8),
    Colors.cyan,
  ];
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

  fetchAllNote() {
    Box<NoteModel> notesBox = Hive.box<NoteModel>(kNotesBox);
    notes = notesBox.values.toList();
    emit(NotesSuccess());
  }
}
