import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/Views/widget/add_note_buttom_sheet.dart';
import 'package:notes_app/Views/widget/notes_view_body.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: Scaffold(
        body: const NotesViewBody(),
        floatingActionButton: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          backgroundColor: kPrimaryColor,
          onPressed: () {
            showModalBottomSheet(
                // shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(24)),
                context: context,
                builder: (context) => const AddNoteButtomSheet());
          },
          child: const Icon(
            Icons.add,
            color: black,
          ),
        ),
      ),
    );
  }
}
