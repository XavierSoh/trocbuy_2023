import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../res/styles.dart';
import '../ads_of_author.dart';

import '../../../providers/selected_ad.dart';
import '../../../res/strings.dart';
import '../../../utils/utils.dart';
import '../../help_and_about/condition_general.dart';

class Author extends StatelessWidget {
  const Author({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentAd = context.read<SelectedAd>().ad;
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 8.0),
      child: Column(
        children: <Widget>[
          //Author Name And CGU
          SizedBox(
            width: MediaQuery.of(context).size.width * 95 / 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 60 / 100,
                    child: Row(
                      children: <Widget>[
                        const Icon(Icons.person),
                        (currentAd!.name != null)
                            ? SizedBox(
                                width: MediaQuery.of(context).size.width / 3,
                                child: AutoSizeText(
                                  currentAd.name!,
                                  overflow: TextOverflow.fade,
                                  maxLines: 3,
                                  style: const TextStyle(fontSize: 14.0),
                                ),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  child: Image.asset(
                    Utils.kCguPath,
                    width: 150.0,
                  ), //CGU
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConditionGenerale(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          //All Ads and like button
          SizedBox(
            width: MediaQuery.of(context).size.width * 93 / 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AdsOfAuthor.id);
                  },
                  child: Text(
                    Strings.kAllHisAds,
                    style: const TextStyle(
                      color: Colors.indigo,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SimilarAdsTitle extends StatelessWidget {
  const SimilarAdsTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0, top: 8.0),
      child: Row(
        children: const <Widget>[
          Icon(Icons.content_copy),
          Text(
            'ANNONCES SIMILAIRES',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class Line extends StatelessWidget {
  const Line({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        height: 0.4,
        width: MediaQuery.of(context).size.width,
        color: Styles.principalColor,
      ),
    );
  }
}
