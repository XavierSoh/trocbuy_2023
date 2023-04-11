import 'package:flutter/material.dart';
import 'package:ribbon_widget/ribbon_widget.dart';
//import 'package:ribbon/ribbon.dart';
import '../../components/cached_network_image_row.dart';

import '../../../model/ad.dart';
import '../../../res/strings.dart';

class AdImageComponentRow extends StatelessWidget {
  const AdImageComponentRow({Key? key, required this.ad}) : super(key: key);
  final Ad ad;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width / 3.5,
      height: width / 3.5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: ad.urgent == 1
            ? Ribbon(
                location: RibbonLocation.topEnd,
                title: Strings.kUrgent,
                farLength: 0.0,
                nearLength: 55.0,
                titleStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
                color: Colors.green.withOpacity(.6),
                child: CustomCachedNetworkImageRow(
                  ad: ad,
                ),
              )
            : CustomCachedNetworkImageRow(
                ad: ad,
              ),
      ),
    );
  }
}
