import 'package:flutter/material.dart';
import 'package:notes_app/cubits/add_note_cubit.dart/add_note_cubit.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.index});
  final bool isActive;
  final int index;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 28,
      backgroundColor: AddNoteCubit().getColor(index),
      child: isActive ? const Icon(Icons.check, size: 50) : null,
    );
  }
}
