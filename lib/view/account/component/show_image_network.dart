import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ShowImageNetwork extends StatelessWidget {
  const ShowImageNetwork({
    Key? key,
    required this.height,
    required this.url,
  }) : super(key: key);
  final String url;
  final double height;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
          height: height),
      progressIndicatorBuilder: (context, url, downloadProgress) => Container(
        height: height,
        child: Center(
          child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
              value: downloadProgress.progress),
        ),
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
