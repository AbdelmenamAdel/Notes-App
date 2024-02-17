import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/Views/widget/custom_button.dart';
import 'package:notes_app/Views/widget/custom_text_form_field.dart';
import 'package:notes_app/cubits/add_note_cubit.dart/add_note_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'Title',
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            hintText: 'Content',
            maxLines: 5,
            height: 135,
            onSaved: (value) {
              content = value;
            },
          ),
          const SizedBox(height: 12),
          const ColorsListView(),
          const SizedBox(height: 12),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoadingState ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var currentDate = DateTime.now();
                    var formattedDate = DateFormat.yMMMd().format(currentDate);
                    var noteModel = NoteModel(
                      title: title!,
                      content: content!,
                      date: formattedDate,
                      color: Colors.blue.value,
                    );
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
              );
            },
          ),
          const SizedBox(height: 24)
        ],
      ),
    );
  }
}

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.index});
  final bool isActive;
  final int index;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 35,
      backgroundColor: NotesCubit().getColor(index),
      child: isActive ? const Icon(Icons.check, size: 50) : null,
    );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: GestureDetector(
              onTap: () {
                NotesCubit().currentIndex = index;
                currentIndex = index;
                setState(() {});
              },
              child: ColorItem(
                isActive: currentIndex == index,
                index: index,
              )),
        ),
      ),
    );
  }
}
