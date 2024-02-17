import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomSearshIcon extends StatelessWidget {
  const CustomSearshIcon({super.key, required this.icon, this.onPressed});
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(.18),
          borderRadius: BorderRadius.circular(16)),
      child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 28,
            color: white,
          )),
    );
  }
}
