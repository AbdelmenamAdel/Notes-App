import 'package:flutter/material.dart';
import 'package:notes_app/Views/widget/custom_app_bar.dart';
import 'package:notes_app/Views/widget/custom_text_form_field.dart';

class EditNotesViewBody extends StatelessWidget {
  const EditNotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 50),
          const CustomAppBar(title: 'Edit Notes', icon: Icons.check),
          const SizedBox(height: 50),
          CustomTextFormField(hintText: 'Title'),
          const SizedBox(height: 16),
          CustomTextFormField(hintText: 'Content', maxLines: 5, height: 135),
        ],
      ),
    );
  }
}
