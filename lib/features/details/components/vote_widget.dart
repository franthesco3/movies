import 'package:flutter/material.dart';

class VoteAverage extends StatelessWidget {
  final String vote;

  const VoteAverage({super.key, required this.vote});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Text(
            'Nota: $vote',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8),
          const Icon(
            Icons.star,
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }
}
