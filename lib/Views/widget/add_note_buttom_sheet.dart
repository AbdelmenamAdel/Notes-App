import 'package:flutter/material.dart';
import 'package:notes_app/Views/widget/custom_button.dart';
import 'package:notes_app/Views/widget/custom_text_form_field.dart';

class AddNoteButtomSheet extends StatelessWidget {
  const AddNoteButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextFormField(hintText: 'Title'),
            const SizedBox(height: 16),
            CustomTextFormField(
              hintText: 'Content',
              maxLines: 5,
              height: 135,
            ),
            const SizedBox(height: 50),
            const CustomButton(),
          ],
        ),
      ),
    );
  }
}
