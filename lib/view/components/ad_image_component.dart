import 'package:flutter/material.dart';
import 'package:ribbon_widget/ribbon_widget.dart';

import '../../model/ad.dart';

//import 'package:ribbon/ribbon.dart';
import '../../res/strings.dart';
import '../ad_details/components/custom_cached_network_image_grid.dart';

class AdImageComponent extends StatelessWidget {
  final Ad ad;

  const AdImageComponent({Key? key, required this.ad}) : super(key: key);
  static const nearLength = 55.0;
  static const farLength = 0.0;

  @override
  build(BuildContext context) {
    return Container(
      height: 240,
        decoration: ad.framed == 1 ? BoxDecoration(
            border: Border.all(
                width: 2,
                color: Colors.green
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: Colors.lime.withOpacity(0.3)
        ):null,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(2),
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
                      fontWeight: FontWeight.bold,
                    ),
                    color: Colors.green.withOpacity(.6),
                    child: CustomCachedNetWorkImageGrid(ad: ad),
                  )
                : CustomCachedNetWorkImageGrid(ad: ad),
          ),
        ),
      ),
    );
  }
}
