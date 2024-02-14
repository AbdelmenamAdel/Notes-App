import 'package:flutter/material.dart';
import 'package:notes_app/Views/widget/custom_text_form_field.dart';

class AddNoteButtomSheet extends StatelessWidget {
  const AddNoteButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'Title',
          ),
          CustomTextFormField(
            hintText: 'Content',
          ),
        ],
      ),
    );
  }
}
