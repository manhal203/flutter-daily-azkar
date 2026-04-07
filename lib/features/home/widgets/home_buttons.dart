import 'package:flutter/material.dart';

class HomeButtons extends StatelessWidget {
  const HomeButtons({super.key, required this.title, required this.onTap});
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 50,
      child: ElevatedButton.icon(
        label: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        onPressed: onTap,
      ),
    );
  }
}
