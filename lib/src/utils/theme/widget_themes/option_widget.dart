import 'package:flutter/material.dart';

class OptionWidget extends StatelessWidget {
  final IconData icon;
  final String label;

  const OptionWidget({Key? key, required this.icon, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon),
        SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}
