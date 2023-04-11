import 'package:flutter/material.dart';

import '../../../model/ad.dart';

class AdPictureNumComponent extends StatelessWidget {
  final Ad ad;
  const AdPictureNumComponent({Key? key, required this.ad}) : super(key: key);

  @override
  build(BuildContext context) {
    return ad.picturesNum! > 0
        ? Positioned(
            left: ad.picturesNum! < 10 ? 4 : 8,
            top: ad.picturesNum! < 10 ? 10 : 18,
            child: Badge(
              child: /*ad.picturesNum!<9?const */ const Icon(
                Icons.camera_alt,
                size: 28,
              ) /*:const SizedBox.shrink()*/,
              backgroundColor: Colors.redAccent,
              label: Text(
                ad.picturesNum.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
