import 'package:flutter/material.dart';
import 'package:ribbon_widget/ribbon_widget.dart';
//import 'package:ribbon/ribbon.dart';

import '../../../model/ad.dart';
import '../../../res/strings.dart';
import 'custom_cached_network_image_grid.dart';

class ImageComponentRow extends StatelessWidget {
  const ImageComponentRow({
    Key? key,
    required this.ad,
    required this.farLength,
    required this.nearLength,
    required this.height,
  }) : super(key: key);

  final Ad ad;
  final double farLength;
  final double nearLength;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 4,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: ad.urgent == 1
              ? Ribbon(
                  location: RibbonLocation.topEnd,
                  title: Strings.kUrgent,
                  farLength: farLength,
                  nearLength: nearLength,
                  titleStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                  color: Colors.green.withOpacity(.6),
                  child: CustomCachedNetWorkImageGrid(
                    ad: ad,
                  ),
                )
              : CustomCachedNetWorkImageGrid(
                  ad: ad,
                ),
        ),
      ),
    );
  }
}
