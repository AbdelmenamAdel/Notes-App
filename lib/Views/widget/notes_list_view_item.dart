import 'package:flutter/material.dart';
import 'package:notes_app/Views/widget/custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: NoteItem(),
      ),
    );
  }
}
