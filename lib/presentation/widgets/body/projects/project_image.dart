import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProjectImage extends StatelessWidget {
  const ProjectImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fadeInDuration: const Duration(milliseconds: 300),
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
      errorWidget: (context, url, error) {
        return Center(
          child: Icon(
            Icons.image_not_supported,
            color: Theme.of(context).colorScheme.primary,
            size: 60,
          ),
        );
      },
      placeholder: (context, url) {
        return Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).colorScheme.primary,
          ),
        );
      },
    );
  }
}

