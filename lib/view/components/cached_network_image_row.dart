import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../global_functions/ads_functions.dart';
import '../../model/ad.dart';
import 'image_pending_text.dart';

class CustomCachedNetworkImageRow extends StatelessWidget {
  const CustomCachedNetworkImageRow({Key? key, required this.ad})
      : super(key: key);
  final Ad ad;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      errorWidget: (context, url, error) => const Icon(Icons.error),
      placeholder: (context, url) => const ImagePendingText(),
      imageUrl: AdsFunctions.generateImageUrlFromAd(ad.pictureName.toString()),
      fadeOutDuration: const Duration(microseconds: 50),
      fadeInDuration: const Duration(microseconds: 50),
      fit: BoxFit.fill,
      memCacheHeight: 300,
      memCacheWidth: 300,
    );
  }
}
