import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class LazyLoadedImage extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final double? scale;

  const LazyLoadedImage(
      {required this.imageUrl, Key? key, this.height, this.width, this.scale})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
      fit: BoxFit.cover,
      height: height,
      width: width,
    );
  }
}
