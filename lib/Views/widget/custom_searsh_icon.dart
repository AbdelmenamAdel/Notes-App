import 'package:flutter/material.dart';

class CustomSearshIcon extends StatelessWidget {
  const CustomSearshIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(.18),
          borderRadius: BorderRadius.circular(16)),
      child: const Icon(Icons.search, size: 28),
    );
  }
}
