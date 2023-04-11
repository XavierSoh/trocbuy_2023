import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../model/cat_lang.dart';
import '../../components/ad_sort_button.dart';

import '../../../global_functions/launch_link.dart';
import '../../../providers/selected_cat_lang.dart';
import '../../category/single_category_ads.dart';

class CatLangSlideItem extends StatelessWidget {
  final String? url;
  final int idCat;
  const CatLangSlideItem({Key? key, required this.idCat, this.url})
      : super(key: key);

  @override
  build(BuildContext context) {
    final CatLang catLang =
        CatLang.catsLang.firstWhere((element) => element.idCat == idCat);
    final currentCatLang = context.read<SelectedCatLang>();
    return Expanded(
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 0, top: 0, right: 0.2, bottom: 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        "images/cat_lang/${idCat.toString()}.jpg",
                      ),
                    ),
                  ),
                ),
              ),
              onTap: () async {
                if (url != null) {
                  LaunchLink().launchURL(url!, context);
                } else {
                  AdSortButton.isOnRegionPage = false;
                  AdSortButton.isArroundMe = false;
                  AdSortButton.isAllFrance = false;
                  AdSortButton.isOnAuthorPage = false;
                  AdSortButton.isFilter = false;
                  currentCatLang.changeCatLang(catLang);
                  Navigator.pushNamed(
                    context,
                    SingleCategoryAds.id,
                  );
                }
              },
            ),
          ),
          Column(
            children: <Widget>[
              const Expanded(child: SizedBox.shrink()),
              Padding(
                padding: const EdgeInsets.only(
                  left: 6.0,
                  bottom: 4.0,
                ),
                child: AutoSizeText(
                  catLang.nameCatLang!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
