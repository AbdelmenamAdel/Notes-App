import 'package:flutter/material.dart';
import 'package:notes_app/Views/widget/edit_notes_view_body.dart';
import 'package:notes_app/models/note_model.dart';

class EditNotesView extends StatelessWidget {
  const EditNotesView({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNotesViewBody(note: note),
    );
  }
}
