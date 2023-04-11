import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart' show CupertinoActivityIndicator;
import 'package:flutter/material.dart';
import '../filter_functions.dart';

import '../../../res/strings.dart';

class CountFilterResult extends StatelessWidget {
  const CountFilterResult({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0, left: 8),
      child: FutureBuilder(
        future: FilterFunctions.countFilterResult(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            int quantity = snapshot.data;
            if (quantity > 0) {
              const style = TextStyle(fontSize: 16);
              return quantity > 1
                  ? AutoSizeText(
                      "$quantity ${Strings.kAdsByFilter}",
                      style: style,
                      maxLines: 2,
                    )
                  : AutoSizeText(
                      "$quantity ${Strings.kAdByFilter} ",
                      style: style,
                      maxLines: 2,
                    );
            } else {
              return const SizedBox.shrink();
            }
          }
          return const CupertinoActivityIndicator();
        },
      ),
    );
  }
}
