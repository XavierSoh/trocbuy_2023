import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../../res/styles.dart';
import '../ad_details/components/ad_image_component_row.dart';
import 'ad_favorite_icons_component.dart';

import '../../model/ad.dart';
import '../../model/date_helper.dart';
import '../../providers/selected_ad.dart';
import '../../res/strings.dart';
import '../ad_details/ad_details.dart';
import 'ad_city_component.dart';
import 'ad_picture_num_component.dart';
import 'ad_price_component.dart';
import 'ad_time_component.dart';

class AdSingleItemRow extends StatelessWidget {
  const AdSingleItemRow({Key? key, required this.ad}) : super(key: key);
  final Ad ad;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          child: Container(
            decoration: ad.framed == 1 ? BoxDecoration(
                border: Border.all(
                    width: 4,
                    color: Colors.green
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: Colors.lime.withOpacity(0.3)
            ) : null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    AdImageComponentRow(
                      ad: ad,
                    ),
                    AdPictureNumComponent(ad: ad),
                    AdFavoriteIconsComponent(idAd: ad.idAd.toString())
                  ],
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AdRowTitle(ad: ad),
                      AdPriceComponent(price: ad.price, centerText: false),
                      AdCityComponent(ad: ad, centerText: false),
                      AddTimeComponent(
                        dateHelper: DateHelper(
                          date: ad.calendarDate ?? "",
                          hour: ad.hour ?? "",
                        ),
                        isCentered: false,
                      ),
                    ],
                  ),
                )
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
        ),
      ),
    );
  }
}

class AdRowTitle extends StatelessWidget {
  const AdRowTitle({
    Key? key,
    required this.ad,
  }) : super(key: key);

  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        ad.title.toString().trim(),
        maxLines: 1,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 16.0,
          color: Styles.principalColor,
        ),
      ),
    );
  }
}
