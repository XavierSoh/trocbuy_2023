import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ribbon_widget/ribbon_widget.dart';
//import 'package:ribbon/ribbon.dart';
import '../../../global_functions/ads_functions.dart';
import '../../../model/filter_names.dart';
import '../../../res/strings.dart';
import '../../../res/styles.dart';
import 'ad_single_image.dart';

import '../../../model/ad_image_model.dart';
import '../../../providers/selected_ad.dart';

class AdImages extends StatelessWidget {
  const AdImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedAd = context.read<SelectedAd>().ad;

    return FutureBuilder(
      future: AdsFunctions.getAdImages(
          FilterNames.singleAdImages.name, selectedAd!.idAd!),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final height = MediaQuery.of(context).size.height * 45 / 100;
          final List<AdImageModel> adImageModels = snapshot.data;
          return CarouselSlider.builder(
            options: Styles.carousselOptionsForImages(height),
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index, int index2) {
              return selectedAd.urgent == '1'
                  ? Ribbon(
                      location: RibbonLocation.topStart,
                      title: Strings.kUrgent,
                      farLength: 75,
                      nearLength: 0,
                      titleStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      color: Colors.green.withOpacity(.6),
                      child: AdSingleImage(
                        adImageModel: adImageModels[index],
                      ),
                    )
                  : AdSingleImage(
                      adImageModel: adImageModels[index],
                    );
            },
          );
        }
        if (snapshot.hasError) {
          return Text(Strings.kImagePendingText);
        }
        return Container(color: Colors.red);
      },
    );
  }
}
