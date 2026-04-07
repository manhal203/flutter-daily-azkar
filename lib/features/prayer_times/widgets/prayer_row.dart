import 'package:flutter/material.dart';

class PrayerRow extends StatelessWidget {
  final String name;
  final String time;

  const PrayerRow({super.key, required this.name, required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Text(
            name,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Text(time, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
