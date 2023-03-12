import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CardMovie extends StatelessWidget {
  final String path;

  const CardMovie({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: path,
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
