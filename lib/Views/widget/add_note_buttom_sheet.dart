import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Views/widget/add_note_form.dart';
import 'package:notes_app/cubits/add_note_cubit.dart/add_note_cubit.dart';

class AddNoteButtomSheet extends StatelessWidget {
  const AddNoteButtomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddNoteCubit>(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailureState) {
            print('Failed ${state.errMessage}');
          }
          if (state is AddNoteSuccessState) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return const Padding(
            padding: EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: AddNoteForm(),
            ),
          );
        },
      ),
    );
  }
}
