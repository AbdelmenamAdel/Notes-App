import 'package:flutter/material.dart';
import 'package:notes_app/Views/widget/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(children: [NotesViewBody()]),
    );
  }
}
