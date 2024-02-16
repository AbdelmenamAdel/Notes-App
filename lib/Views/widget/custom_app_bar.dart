import 'package:flutter/material.dart';
import 'package:notes_app/Views/widget/custom_searsh_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.title, required this.icon, this.onPressed});
  final String title;
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 28),
        ),
        const Spacer(),
        CustomSearshIcon(
          icon: icon,
          onPressed: onPressed,
        )
      ],
    );
  }
}
