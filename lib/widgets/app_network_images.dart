import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({super.key, required this.src,  this.height = 100,  this.width = 100, this.fit = BoxFit.contain});

  final String src;
  final double height;
  final double width;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: "$src",
      height: height,
      width: width,
      fit: fit,

      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}