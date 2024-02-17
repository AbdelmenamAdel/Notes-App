import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Views/widget/add_note_form.dart';
import 'package:notes_app/Views/widget/custom_app_bar.dart';
import 'package:notes_app/Views/widget/custom_text_form_field.dart';
import 'package:notes_app/cubits/add_note_cubit.dart/add_note_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';

class EditNotesViewBody extends StatefulWidget {
  const EditNotesViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNotesViewBody> createState() => _EditNotesViewBodyState();
}

class _EditNotesViewBodyState extends State<EditNotesViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 50),
          CustomAppBar(
            title: 'Edit Notes',
            icon: Icons.check,
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.content = content ?? widget.note.content;
              widget.note.color =
                  BlocProvider.of<NotesCubit>(context).color.value;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNote();
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 50),
          CustomTextFormField(
            hintText: widget.note.title,
            onChange: (value) {
              title = value;
            },
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            hintText: widget.note.content,
            maxLines: 5,
            height: 135,
            onChange: (value) {
              content = value;
            },
          ),
          const SizedBox(height: 16),
          EditNoteColorsList(note: widget.note)
        ],
      ),
    );
  }
}

class EditNoteColorsList extends StatefulWidget {
  const EditNoteColorsList({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditNoteColorsList> createState() => _EditNoteColorsListState();
}

class _EditNoteColorsListState extends State<EditNoteColorsList> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).currentIndex =
        BlocProvider.of<NotesCubit>(context)
            .colors
            .indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    NotesCubit cubit = BlocProvider.of<NotesCubit>(context);
    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cubit.colors.length - 1,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: GestureDetector(
            onTap: () {
              cubit.currentIndex = index;
              cubit.color = cubit.getColor(index);
              setState(() {});
            },
            child: ColorItem(
              isActive:
                  BlocProvider.of<NotesCubit>(context).currentIndex == index,
              index: index,
            ),
          ),
        ),
      ),
    );
  }
}
