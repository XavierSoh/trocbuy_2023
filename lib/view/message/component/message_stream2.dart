import 'package:flutter/material.dart';
import '../../../res/styles.dart';
import '../../components/ad_single_item_row.dart';

import '../../../global_functions/ads_functions.dart';
import '../../../model/filter_names.dart';

class MessageStream2 extends StatelessWidget {
  final String id;
  MessageStream2({required this.id});

  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(
      future: AdsFunctions().getAdsByParameters(
        FilterNames.singleAd.name,
        {"id_ad": id},
      ),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: AdSingleItemRow(ad: snapshot.data[0]));
        }
        return const LinearProgressIndicator(
          backgroundColor: Styles.principalColor,
        );
      },
    );
  }
}
