import 'package:flutter/material.dart';
import '../../../res/strings.dart';

class SimilarAdsTitle extends StatelessWidget {
  const SimilarAdsTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0, top: 8.0),
      child: Row(
        children: <Widget>[
          const Icon(Icons.content_copy),
          Text(
            Strings.kSimilarAds,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
