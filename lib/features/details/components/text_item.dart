import 'package:flutter/material.dart';

class TextItem extends StatelessWidget {
  final String title;
  final double? fontSize;
  final FontWeight? bold;

  const TextItem({super.key, required this.title, this.fontSize, this.bold});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: bold,
              color: Colors.white,
              fontSize: fontSize ?? 12,
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
