import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../global_functions/ads_functions.dart';
import '../../../model/ad_image_model.dart';
import '../../../res/strings.dart';
import '../../../utils/utils.dart';

import '../../../res/styles.dart';

class AdSingleImage extends StatelessWidget {
  const AdSingleImage({Key? key, required this.adImageModel}) : super(key: key);
  final AdImageModel adImageModel;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(
            color: Styles.principalColor,
            width: 0.3,
          ),
        ),
        child: CachedNetworkImage(
          errorWidget: (context, url, error) => CachedNetworkImage(
            imageUrl: Utils.errorImageUrl,
          ),
          placeholder: (context, url) => Center(
            child: Text(
              Strings.kImagePendingText,
              style: const TextStyle(fontSize: 16.0),
            ),
          ),
          imageUrl: AdsFunctions.generateImageUrlFromAd(
            adImageModel.pictureName!,
          ),
          fadeOutDuration: const Duration(seconds: 1),
          fadeInDuration: const Duration(seconds: 1),
          fit: BoxFit.fill,
          height: 300,
          width: MediaQuery.of(context).size.width,
        ));
  }
}
