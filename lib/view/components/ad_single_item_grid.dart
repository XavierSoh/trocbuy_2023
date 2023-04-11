import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../../res/styles.dart';
import 'ad_city_component.dart';
import 'ad_favorite_icons_component.dart';
import 'ad_image_component.dart';
import 'ad_time_component.dart';
import 'ad_title_component.dart';

import '../../model/ad.dart';
import '../../model/date_helper.dart';
import '../../providers/selected_ad.dart';
import '../../res/strings.dart';
import '../ad_details/ad_details.dart';
import 'ad_picture_num_component.dart';
import 'ad_price_component.dart';

class AdSingleItemGrid extends StatelessWidget {
  const AdSingleItemGrid({Key? key, required this.ad}) : super(key: key);
  final Ad ad;

  @override
  build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: GestureDetector(
        child: Wrap(
          children: <Widget>[
            Stack(
              children: <Widget>[
                AdImageComponent(ad: ad),
                AdPictureNumComponent(ad: ad),
                AdFavoriteIconsComponent(
                  idAd: ad.idAd.toString(),
                )
              ],
            ),
            AdTitleComponent(
              title: ad.title!,
            ),
            AdPriceComponent(
              price: ad.price,
            ),
            AdCityComponent(
              ad: ad,
            ),
            const SizedBox(height: 5),
            AddTimeComponent(
              dateHelper: DateHelper(
                date: ad.calendarDate!,
                hour: ad.hour!,
              ),
            ),
          ],
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
    );
  }
}
