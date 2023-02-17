import 'package:flutter/material.dart';

class CardMovie extends StatelessWidget {
  final String path;

  const CardMovie({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
            color: Colors.blue,
          ),
          child: Image.network(
            path,
          ),
        ),
      ],
    );
  }
}
