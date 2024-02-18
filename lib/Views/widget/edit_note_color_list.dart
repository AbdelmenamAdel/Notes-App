import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Views/widget/color_item.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';

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
        itemCount: cubit.colors.length,
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
