import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:ribbon_widget/ribbon_widget.dart';
//import 'package:ribbon/ribbon.dart';
import '../../../global_functions/ads_functions.dart';
import '../../../res/strings.dart';
import '../../../res/styles.dart';

import '../../../model/ad.dart';
import '../../../providers/selected_ad.dart';
import '../../../utils/utils.dart';
import '../ad_details.dart';

class FeatureSingleItem extends StatelessWidget {
  const FeatureSingleItem({
    Key? key,
    required this.ad,
  }) : super(key: key);
  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ad.urgent == 1
                      ? Ribbon(
                          title: Strings.kUrgent,
                          farLength: 0,
                          nearLength: 38,
                          location: RibbonLocation.topStart,
                          titleStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                          color: Colors.green.withOpacity(.6),
                          child: ImageWidget(ad: ad),
                        )
                      : ImageWidget(ad: ad),
                  ad.price != 0
                      ? Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${ad.price} €',
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Styles.orangeColor,
                                backgroundColor: Colors.white70,
                              ),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.285,
              child: Text(
                ad.title ?? "",
                overflow: TextOverflow.clip,
                maxLines: 1,
                softWrap: true,
                style: const TextStyle(color: Styles.principalColor),
              ),
            ),
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  size: 15.0,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.285,
                  child: Text(
                    ad.city ?? "",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: true,
                    style: const TextStyle(
                      color: Styles.principalColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      onTap: () {
        context.read<SelectedAd>().changeCurrentAd(ad);
        Fluttertoast.showToast(
          msg: Strings.kAdsLoading,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Styles.principalColor,
        );
        Navigator.pushNamedAndRemoveUntil(
          context,
          AdDetail.id,
          (route) => route.isFirst,
        );
      },
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
    required this.ad,
  }) : super(key: key);

  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: CachedNetworkImage(
        memCacheHeight: 300,
        errorWidget: (context, url, error) => const ErrorWidget(),
        placeholder: (context, url) => const ImageWaitingWidget(),
        imageUrl: AdsFunctions.generateImageUrlFromAd(
          ad.pictureName ?? "",
        ),
        fit: BoxFit.fill,
        // width: 100.0,
      ),
    );
  }
}

class ImageWaitingWidget extends StatelessWidget {
  const ImageWaitingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        Strings.kImagePendingText,
        style: const TextStyle(
          fontSize: 16.0,
        ),
      ),
    );
  }
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: Utils.errorImageUrl,
    );
  }
}
