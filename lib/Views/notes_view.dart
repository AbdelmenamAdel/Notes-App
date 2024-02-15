import 'package:flutter/material.dart';
import 'package:notes_app/Views/constants.dart';
import 'package:notes_app/Views/widget/add_note_buttom_sheet.dart';
import 'package:notes_app/Views/widget/custom_text_form_field.dart';
import 'package:notes_app/Views/widget/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const NotesViewBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              // shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(24)),
              context: context,
              builder: (context) => const AddNoteButtomSheet());
        },
        child: const Icon(
          Icons.add,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
