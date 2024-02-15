import 'package:flutter/material.dart';

class CustomSearshIcon extends StatelessWidget {
  const CustomSearshIcon({super.key, required this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(.18),
          borderRadius: BorderRadius.circular(16)),
      child: Icon(icon, size: 28),
    );
  }
}
