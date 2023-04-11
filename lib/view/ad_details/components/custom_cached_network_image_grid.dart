import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../global_functions/ads_functions.dart';
import '../../../model/ad.dart';
import '../../components/image_pending_text.dart';

class CustomCachedNetWorkImageGrid extends StatelessWidget {
  const CustomCachedNetWorkImageGrid({
    Key? key,
    required this.ad,
  }) : super(key: key);

  final Ad ad;

  @override
  build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding:ad.framed == 1 ? const EdgeInsets.all(2.0):EdgeInsets.zero,
      child: CachedNetworkImage(
        filterQuality: FilterQuality.low,
        errorWidget: (context, url, error) => const Icon(Icons.error),
        placeholder: (context, url) => const ImagePendingText(),
        imageUrl: AdsFunctions.generateImageUrlFromAd(ad.pictureName.toString()),
        fadeOutDuration: const Duration(microseconds: 50),
        fadeInDuration: const Duration(microseconds: 50),
        fit: BoxFit.fill,
        width: MediaQuery.of(context).size.width,
        memCacheHeight: 300,
        memCacheWidth: 300,
        height: height * 35 / 100,
      ),
    );
  }
}
