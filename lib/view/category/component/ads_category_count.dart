import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart' show CupertinoActivityIndicator;
import 'package:flutter/material.dart';

import '../../../model/cat_lang.dart';
import '../../../res/strings.dart';
import '../cat_lang_functions.dart';

class AdsCategoryCount extends StatelessWidget {
  const AdsCategoryCount({
    Key? key,
    required this.currentCatLang,
  }) : super(key: key);

  final CatLang? currentCatLang;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0, left: 8),
      child: FutureBuilder(
          future: CatLangFunctions.getCatQuantity(currentCatLang!),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              int quantity = snapshot.data;
              if (quantity > 0) {
                const style = TextStyle(fontSize: 16);
                return quantity > 1
                    ? AutoSizeText(
                        "$quantity ${Strings.kAdsIn} ${currentCatLang!.nameCatLang!}",
                        style: style,
                        maxLines: 2,
                      )
                    : AutoSizeText(
                        "$quantity ${Strings.kAdIn} ${currentCatLang!.nameCatLang!}",
                        style: style,
                        maxLines: 2,
                      );
              }
            }
            return const SizedBox.shrink();
          }),
    );
  }
}
